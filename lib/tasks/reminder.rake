require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
include Rails.application.routes.url_helpers

namespace :reminder do
  desc "TODO"

  # task: check for new sms
  task explore: :environment do
    Reminder.all.each do |r|
      if r.sms_date.day == Time.now.day
        r.sms_status = SmsStatus.find_by_name("sent")
        # here we should send sms and stuff
        case r.alert_times
        when 0 , 1 , 2 , 3
          p = "سلام، \\n #{person.gender.name} #{person.name}، \\n لطفا مبلغ #{r.payment.person.need_to_pay.to_i} تومان را برای آبونه خطابه غدیر و فدک به شماره حساب ۱۲۱۲۳۳ بانک پاسارگاد واریز نمایید. \\n همچنین می توانید از لینک زیر مستقیما مبلغ را پرداخت کنید. \\n  http://ab.khetabeghadir.com?p=#{r.payment.person.id}#aboneh"
          send_msg(r.payment.person,p)
          r.alert_times += 1
          # set this reminder on 2 days from now
          r.sms_date = Time.now + 1.days
          #
          r.save
        else
          # send_msg(r.payment.person,p)
          # cancel this turn payment
          payment = r.payment
          payment.payment_status_id = 3
          payment.save
          last_reminder = payment.reminder
          last_reminder.destroy
          person = r.payment.person
          new_payment = Payment.create do |p|
            p.person = person
            p.amount = (person.pay_amount.to_i + person.id).to_s
            p.deadline = payment.deadline + person.pay_period.days # later month
          end
          p = "سلام، \\n #{person.gender.name} #{person.name}، شما#{person.payments.ignored.count} آبونه پرداخت نشده دارید. \\n موعد پرداخت بعدی شما #{new_payment.deadline.to_pdate.strftime("%e %b %Y")} خواهد بود. \\n درصورت تمایل به انصراف از سامانه آبونه خطابه غدیر و فدک \\n لطفا با شماره ۲۲۳۹۳۸۱۴ تماس حاصل کنید. \\n لینک حساب کاربری شما: \\n http://ab.khetabeghadir.com/#profile \\n شماره موبایل: #{person.mobile_number} \\n رمز عبور: #{person.generate_password}"
          send_msg(person,p)
        end
      end
    end
  end

end
