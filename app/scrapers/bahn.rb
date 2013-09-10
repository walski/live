class Bahn
  URL = 'http://reiseauskunft.bahn.de/bin/bhftafel.exe'

  def initialize
    @date = Date.today.strftime('%d.%m.%y')
    @time = Time.now.strftime('%H:%M')
  end

  def scrape
    @data = Curl.get(url).body_str
  end

  def parse
    @doc = Nokogiri::HTML(@data)
  end

  def departures
    @doc.xpath("//tr[starts-with(@id, 'journeyRow')]").map do |row|
      begin
        {
          time: row.search(".time").first.content.strip,
          train: row.search(".train").last.content.strip.gsub(/\s+/, ' '),
          route: row.search(".route").first.content.strip,
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
    "#{URL}/?input=Hamburg+HBF&date=#{@date}&time=#{@time}&boardType=dep&GUIREQProduct_4=on&start=Suchen"
  end

end
