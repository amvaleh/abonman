require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
include Rails.application.routes.url_helpers

namespace :telegram do
  desc "TODO"

  task send: :environment do
    Telegram.all.where(:read=>false).each do |t|
      puts "iterating..."
      puts t.number
      puts t.teleg_name
      puts t.teleg_name.gsub(" ", "_")
      puts t.message
      res = `(echo "contact_list"; echo "add_contact +98#{t.number} #{t.teleg_name}"; sleep 5; echo 'msg #{t.teleg_name.gsub(" ", "_")} #{t.message}') | #{telegram_path} -W`
      puts "done. result is:"
      puts res.last(100)
      t.read = true
      t.save
    end
  end
end
