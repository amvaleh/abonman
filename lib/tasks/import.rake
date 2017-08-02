require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
include Rails.application.routes.url_helpers
require 'csv'

namespace :import do
  desc "import csv file of People to DB"

  # task: check for new sms
  task people_csv: :environment do
    csv_text = File.read('finallist.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      puts "*"
      puts row.to_hash
      Person.create!(row.to_hash)
    end
  end

end
