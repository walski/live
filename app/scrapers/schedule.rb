class Schedule
  URL = 'http://socoded.com/schedule.json'

  def initialize
    @now  = Time.now
    @date = @now.strftime('%d.%m.%y')
    @time = @now.strftime('%H:%M')
  end

  def fetch
    @data = Curl.get(URL).body_str
  end

  def parse
    @doc = JSON.parse(@data)
  end

  def sessions
    @doc["slots"].map do |entry|
      timestamp     = entry["time"]
      entry["id"]   = timestamp
      entry["time"] = Time.at(timestamp - Time.zone_offset('CEST')).in_time_zone('CET')
      entry
    end
  end

  def self.all
    instance = new
    instance.fetch
    instance.parse
    instance.sessions
  end
end
