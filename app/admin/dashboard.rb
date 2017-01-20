ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "به پنل مدیریتی سامانه همیار پیامکی خطابه غدیر و فدک خوش آمدید"
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent Reminders" do
          ul do
            Reminder.last(5).map do |r|
              li link_to(r.sms_date, admin_reminder_path(r)) , link_to(r.payment.person.name,admin_person_path(r.payment.person))
              br
            end
          end
        end
      end
    end


  end # content
end
