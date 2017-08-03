require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
include Rails.application.routes.url_helpers

namespace :sms do
  desc "TODO"

  task resend_adblock: :environment do
    ShortMessage.all.where("response like ?" , "%ندارد%").each do |s|
      res = send_sms(s.person.mobile_number,s.content)
      s.response = res
      s.save
    end
  end
end
