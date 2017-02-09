module ApplicationHelper

  def send_msg(person,msg)
    if person.email_address.present?
      puts msg
      email = ServiceMailer.send_email(person.email_address,msg).deliver_now
    end
    contact_name = person.name.gsub(" ", "_")
    contact_name2 = contact_name + " " + person.pay_period.to_s + "mah"
    res1 = `#{telegram_path} -W -e "contact_list`
    res1 = `#{telegram_path} -W -e "add_contact +98#{person.mobile_number} #{contact_name2}"`
    msg = "\"#{msg}\""
    puts msg
    puts contact_name
    puts contact_name2
    puts contact_name2.gsub(" ", "_")
    res2 = `#{telegram_path} -W -e 'msg #{contact_name2.gsub(" ", "_")} #{msg}'`
    puts res2
  end

  def telegram_path
    if Rails.env.production?
      "/home/deploy/tg/bin/telegram-cli -k /home/deploy/tg/server.pub"
    else
      "/Users/amirmahdi/Documents/telegram-cli/tg/bin/telegram-cli -k /Users/amirmahdi/Documents/telegram-cli/tg/server.pub"
    end
  end

  def resource_name
   :person
 end

 def resource
   @resource ||= Person.new
 end

 def devise_mapping
   @devise_mapping ||= Devise.mappings[:person]
 end

end
