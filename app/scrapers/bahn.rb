class Bahn
  URL = 'http://reiseauskunft.bahn.de/bin/bhftafel.exe'

  def initialize
    @now  = Time.now
    @date = @now.strftime('%d.%m.%y')
    @time = @now.strftime('%H:%M')
  end

  def scrape
    @data = Curl.get(url).body_str
  end

  def parse
    @doc = Nokogiri::HTML(@data)
  end

  def departures
    @doc.xpath("//tr[starts-with(@id, 'journeyRow')]").each_with_index.map do |row, i|
      begin
        hour, minute = row.search(".time").first.content.strip.split(':')
        {
          id:       i,
          time:     @now.change(hour: hour, min: minute),
          train:    row.search(".train").last.content.strip.gsub(/\s+/, ' '),
          route:    row.search(".route").first.content.strip,
          platform: row.search(".platform").first.content.strip,
        }
      rescue
        Rails.logger.warn $!
      end
    end
  end

  def bergedorf
    departures.select {|entry| entry[:route] =~ /Bergedorf/ }
  end

  def url
    "#{URL}/?input=Hamburg+HBF&date=#{@date}&time=#{@time}&boardType=dep&GUIREQProduct_3=on&GUIREQProduct_4=on&GUIREQProduct_7=on&start=Suchen"
  end

  def self.all
    instance = new
    instance.scrape
    instance.parse
    instance.bergedorf
  end
end
