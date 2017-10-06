require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
include Rails.application.routes.url_helpers

namespace :reminder do
  desc "TODO"

  # task: check for new sms
  task explore: :environment do
    Reminder.all.each do |r|
      if r.sms_date.to_date === Time.now.to_date
        r.sms_status = SmsStatus.find_by_name("sent")
        case r.alert_times
        when 0
          # matn 3
          khotbe = "وَ طاعَتَنا أَهْلَ الْبَيْتِ نِظاماً لِلْمِلَّةِ \\\\n و پيروى ما اهل بيت را مايه ى هم آهنگى ملّت قرار داد.\\\\n"
          p = "#{r.payment.person.gender_fa} #{r.payment.person.name}، با سلام، امروز موعد ما در حمایت نشر خطابه غدیر و فدک می باشد، لطفا آبونمان را از طریق لینک زیر پرداخت نمایید: \\\\n http://ab.khetabeghadir.com/#{r.payment.person.id} \\\\n یا دقیقا مبلغ #{r.payment.person.need_to_pay.to_i}۰ ریال را به شماره کارت  #{r.payment.person.bank_account.card_number} به نام #{r.payment.person.bank_account.name}، بانک #{r.payment.person.bank_account.bank_name} واریز فرمایید."
          send_cron_msg(r.payment.person,p,khotbe)
          r.alert_times += 1
          # set this reminder on 2 days from now
          r.sms_date = Time.now + 7.days
          #
          r.save
        when 1
          #  با شمارش
          khotbe = "وَ طاعَتَنا أَهْلَ الْبَيْتِ نِظاماً لِلْمِلَّةِ \\\\n و پيروى ما اهل بيت را مايه ى هم آهنگى ملّت قرار داد.\\\\n"
          p = "همیار محترم، با سلام، #{(Date.today - r.payment.deadline ).to_i} روز از موعد مشارکت شما سپری شده است و منتظر حمایت شما بزرگواریم. لطفا آبونمان را از طریق لینک زیر پرداخت نمایید:\\\\n http://ab.khetabeghadir.com/#{r.payment.person.id} \\\\n یا دقیقا مبلغ #{r.payment.person.need_to_pay.to_i}۰ ریال را به شماره کارت  #{r.payment.person.bank_account.card_number} به نام #{r.payment.person.bank_account.name}، بانک #{r.payment.person.bank_account.bank_name} واریز فرمایید."

          # p = "همیار محترم، \\\\n #{r.payment.person.gender_fa} #{r.payment.person.name}، سلام علیکم \\\\n امروز موعد ما در حمایت نشر خطابه غدیر و فدک می باشد، لطفا مبلغ #{r.payment.person.need_to_pay.to_i}۰ ریال را به شماره کارت  #{r.payment.person.bank_account.card_number}  \\\\n به نام #{r.payment.person.bank_account.name}، بانک #{r.payment.person.bank_account.bank_name} واریز،\\\\n و یا از طریق لینک زیر به سهولت پرداخت نمایید: \\\\n http://ab.khetabeghadir.com/#{r.payment.person.id}"
          send_cron_msg(r.payment.person,p,khotbe)
          r.alert_times += 1
          # set this reminder on 2 days from now
          r.sms_date = Time.now + 7.days
          #
          r.save
        when 2
          khotbe = "وَ طاعَتَنا أَهْلَ الْبَيْتِ نِظاماً لِلْمِلَّةِ \\\\n و پيروى ما اهل بيت را مايه ى هم آهنگى ملّت قرار داد.\\\\n"
          p = "همیار محترم، با سلام، موعد حمایت شما را از نشر خطابه غدیر و فدک یادآور می شویم، لطفا آبونمان را از طریق لینک زیر پرداخت نمایید:\\\\n http://ab.khetabeghadir.com/#{r.payment.person.id} \\\\n یا دقیقا مبلغ #{r.payment.person.need_to_pay.to_i}۰ ریال را به شماره کارت  #{r.payment.person.bank_account.card_number} به نام #{r.payment.person.bank_account.name}، بانک #{r.payment.person.bank_account.bank_name} واریز فرمایید."
          # p = "همیار محترم، \\\\n #{r.payment.person.gender_fa} #{r.payment.person.name}، سلام علیکم \\\\n امروز موعد ما در حمایت نشر خطابه غدیر و فدک می باشد، لطفا مبلغ #{r.payment.person.need_to_pay.to_i}۰ ریال را به شماره کارت  #{r.payment.person.bank_account.card_number}  \\\\n به نام #{r.payment.person.bank_account.name}، بانک #{r.payment.person.bank_account.bank_name} واریز،\\\\n و یا از طریق لینک زیر به سهولت پرداخت نمایید: \\\\n http://ab.khetabeghadir.com/#{r.payment.person.id}"
          send_cron_msg(r.payment.person,p,khotbe)
          r.alert_times += 1
          # set this reminder on 2 days from now
          r.sms_date = Time.now + 7.days
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
          #
          khotbe = "وَ مَنْ أَوْفى بِما عاهَدَ عَلَيْهُ اللَّهَ فَسَيُؤْتيهِ أَجْراً عَظيماً. \\\\n و خداوند آن را كه بر پيمان الاهى وفادار باشد، پاداش بزرگى خواهد داد. \\\\n"
          p = "همیار محترم، با سلام، #{(Date.today - r.payment.deadline ).to_i} روز از موعد مشارکت شما سپری شده است و همچنان منتظر حمایت شما بزرگواریم. لطفا آبونمان را از طریق لینک زیر پرداخت نمایید: \\\\n http://ab.khetabeghadir.com/#{r.payment.person.id} \\\\n یا دقیقا مبلغ #{r.payment.person.need_to_pay.to_i}۰ ریال را به شماره کارت  #{r.payment.person.bank_account.card_number} به نام #{r.payment.person.bank_account.name}، بانک #{r.payment.person.bank_account.bank_name} واریز فرمایید."
          send_cron_msg(person,p,khotbe)
        end
      end
    end
  end

end
