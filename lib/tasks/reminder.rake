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
        case r.alert_times
        when 0 , 1 , 2
          p = "سلام، \\\\n #{r.payment.person.gender_fa} #{r.payment.person.name}، \\\\n لطفا مبلغ #{r.payment.person.need_to_pay.to_i} تومان را برای آبونه خطابه غدیر و فدک به شماره کارت #{r.payment.person.bank_account.card_number} \\\\n بانک #{r.payment.person.bank_account.bank_name} واریز نمایید، \\\\n همچنین می توانید از لینک زیر مستقیما مبلغ را پرداخت کنید. \\\\n http://ab.khetabeghadir.com/#{r.payment.person.id}"
          send_cron_msg(r.payment.person,p)
          r.alert_times += 1
          # set this reminder on 2 days from now
          r.sms_date = Time.now + 2.days
          #
          r.save
        else
          # cancel this turn payment
          payment = r.payment
          payment.payment_status_id = PaymentStatus.find_by_name("ignored").id
          payment.save
          last_reminder = payment.reminder
          last_reminder.destroy
          person = r.payment.person
          new_payment = Payment.create do |p|
            p.person = person
            p.amount = (person.pay_amount.to_i + person.id).to_s
            p.deadline = payment.deadline + person.pay_period.month # later month
          end
          p = "سلام، \\\\n #{person.gender_fa} #{person.name}، شما#{person.payments.ignored.count} آبونه پرداخت نشده دارید. \\\\n موعد پرداخت بعدی شما #{new_payment.deadline.to_pdate.strftime("%e %b %Y")} خواهد بود. \\\\n لینک حساب کاربری شما: \\\\n http://ab.khetabeghadir.com/profile \\\\n شماره موبایل: #{person.mobile_number} \\\\n رمز عبور: #{person.generate_password}"
          send_cron_msg(person,p)
        end
      end
    end
  end

end
