ActiveAdmin.register Reminder do

  menu label: "برنامه یادآوری" , priority: 3

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :sms_status_id, :payment_id, :sms_date , :alert_times

  config.filters = false

  index :title => 'یادآورها'  do
    selectable_column
    column :id
    column "تاریخ ارسال پیامک" do |r|
      r.sms_date.to_pdate.strftime("%A %d %b %Y")
    end
    column "واحد پرداخت" do |r|
      link_to "#{r.payment.person.name}-#{r.payment.deadline.to_pdate.strftime("%b")}", admin_payment_path(r.payment)
    end
    column "پیام های مرسل" do |r|
      r.alert_times
    end
    actions
  end

  form do |f|
    f.inputs "Payment" do
      f.input :payment_id , :as => :select, :collection => Payment.all.order("created_at").collect {|p| ["#{p.deadline.to_pdate.strftime("%A %d %b %Y")}-#{p.person.name}", p.id]}
      f.input :sms_status
      f.input :sms_date
      f.input :alert_times
    end
    f.actions

  end
end
