module ApplicationHelper

  def send_msg(person,msg)
    contact_name = person.name.gsub(" ", "_")
    contact_name2 = contact_name + " " + person.pay_period.to_s + "mah"
    res1 = `#{telegram_path} -W -e "add_contact +98#{person.mobile_number} #{contact_name2}"`
    msg = "\"#{msg}\""
    puts msg
    res2 = `#{telegram_path} -W -e 'msg #{contact_name2.gsub(" ", "_")} #{msg}'`
  end

  def telegram_path
    "/Users/amirmahdi/Documents/telegram-cli/tg/bin/telegram-cli"
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
