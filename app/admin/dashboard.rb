ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: "خانه"


  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container rtl", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "به پنل مدیریتی سامانه همیار پیامکی خطابه غدیر و فدک خوش آمدید"
      end
    end

    columns do
      column span: 1 do
        span " "
        panel "مشترکین" , class: "rtl"do
        columns do
          column do
            render partial: "person_charts"
          end
        end
      end
    end
    column span: 1 do
      span " "
      panel "پرداخت ها" , class: "rtl" do
        columns do
          column do
            render partial: "payment_charts"
          end
        end
      end
    end
  end
  columns do
    column do
      panel "افراد" , class: "rtl" do
        columns do
          column do
            render partial: "rates_charts"
          end
        end
      end
    end
  end
end # content


# sidebar :help do
#   ul do
#     li "Second List First Item"
#     li "Second List Second Item"
#   end
# end

end
