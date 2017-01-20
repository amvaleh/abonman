ActiveAdmin.register Reminder do

  menu priority: 3

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :sms_status_id, :payment_id, :sms_date , :alert_times

  index do
    selectable_column
    column :id
    column :sms_date
    column :payment
    column :alert_times
    column :sms_status_id
    actions
  end

end
