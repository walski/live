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
      # FIXME (ps) two possible solutions here
      # 1. timestamp is broken
      # 2. i am to stupid to work with timezones
      entry["time"] = Time.at(timestamp)
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
