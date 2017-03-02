ActiveAdmin.register BankAccount do

  permit_params :support_number,:support_email , :card_number , :account_number , :name ,:merchant_code , :bank_name

  menu label: " حساب های بانکی" , priority: 2

  index :title => 'مدیران' do
    selectable_column
    column  "نام مالک حساب" ,  :name
    column "کد درگاه زرین پال" ,:merchant_code
    column "نام بانک" ,:bank_name
    column "شماره کارت حساب" ,:card_number
    column "شماره حساب" ,:account_number
    column "ایمیل پشتیبانی حساب" ,:support_email
    column "شماره موبایل پشتیبانی حساب" ,:support_number
    actions
  end
  #
  filter :name , label: "نام مالک حساب"
  filter :merchant_code , label: "کد درگاه زرین پال"
  filter :bank_name , label: "نام بانک"
  filter :card_number , label: "شماره کارت حساب"
  filter :account_number , label: "شماره حساب"
  filter :support_email, label: "ایمیل پشتیبانی حساب"
  filter :support_number , label: "شماره موبایل پشتیبانی حساب"

  #
  form do |f|
    f.inputs "Admin Details" do
      f.input :name , label: "نام مالک حساب"
      f.input :merchant_code , label: "کد درگاه زرین پال"
      f.input :bank_name , label: "نام بانک"
      f.input :card_number , label: "شماره کارت حساب"
      f.input :account_number , label: "شماره حساب"
      f.input :support_email , label: "ایمیل پشتیبانی حساب"
      f.input :support_number , label: "شماره موبایل پشتیبانی حساب"
    end
    f.actions
  end

  show do
    attributes_table  do
      row :id
      row  "نام مالک حساب" do |p|
      p.name
    end
      row "کد درگاه زرین پال" do |p|
      p.merchant_code
    end
    row  "نام بانک" do |p|
    p.bank_name
    end
    row  "شماره کارت حساب" do |p|
    p.card_number
    end
    row "شماره حساب" do |p|
    p.account_number
    end
    row "ایمیل پشتیبانی حساب" do |p|
    p.support_email
    end
    row "شماره موبایل پشتیبانی حساب" do |p|
    p.support_number
    end
  end
end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
