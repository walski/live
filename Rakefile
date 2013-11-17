# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Live::Application.load_tasks

desc "Import Guestlist - This will DELETE all existing participants"
task :import_guestlist => :environment do
  raise "Must set GUESTLIST_URL before running this!" unless ENV['GUESTLIST_URL']

  require 'csv'
  require 'open-uri'

  data = open(ENV['GUESTLIST_URL']).read.to_s.force_encoding('utf-8')
  doc = CSV.parse(data)

  Participant.transaction do
    Participant.destroy_all
    doc.each do |participant|

      qr_code = participant[0]
      next if !qr_code || qr_code == 'qr code'

      name = participant[1]
      next if !name

      profile_url = participant[13]
      xing_id = profile_url ? File.basename(profile_url) : nil

      print "Importing: ##{qr_code}: #{name}..."
      Participant.create!(qr_code: qr_code, name: name, photo_url: participant[12], profile_url: profile_url, xing_id: xing_id)
      puts " done."
    end
  end

  puts "Done. #{Participant.count} participants imported."
end