module ApplicationHelper

  def send_msg(person,msg)
    if person.email_address.present?
      puts msg
      puts "HHHAAABBBCCCDDD"
      email = ServiceMailer.send_email(person.email_address,msg).deliver_now
    end
    contact_name = person.name.gsub(" ", "_")
    contact_name2 = contact_name + " " + person.pay_period.to_s + "mah"
    res1 = `#{telegram_path} -W -e "add_contact +98#{person.mobile_number} #{contact_name2}"`
    msg = "\"#{msg}\""
    puts msg
    res2 = `#{telegram_path} -W -e 'msg #{contact_name2.gsub(" ", "_")} #{msg}'`
  end

  def telegram_path
    # if Rails.env.production?
      # "/home/deploy/tg/bin/telegram-cli"
      "/Users/amirmahdi/Documents/telegram-cli/tg/bin/telegram-cli"
    # else
    # end
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
