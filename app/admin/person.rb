ActiveAdmin.register Person do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :email_address, :mobile_number,:phone_number,:pay_start,:pay_period,:pay_amount, :gender_id,:city_id,:birthdate,:phone_number , :encrypted_password, :password,:bank_account_id

  menu label: "مشترکین" , priority: 2

  scope proc{ I18n.t'active_admin.scope.people.all'}, :all
  scope proc{ I18n.t'active_admin.scope.people.men'}, :men
  scope proc{ I18n.t'active_admin.scope.people.women'} , :women
  scope proc{ I18n.t'active_admin.scope.people.tehran'}, :tehran
  scope proc{ I18n.t'active_admin.scope.people.khosh_heshab'}, :khosh_heshab

  index :title => 'مشترکین' do
    render "person_index"
    selectable_column
    column :id
    column "نام" do |p|
      p.name
    end
    column "شماره موبایل" do |p|
      p.mobile_number
    end
    column "شروع دوره" do |p|
      p.pay_start.to_pdate.strftime("%A %d %b %Y")
    end
    column "دوره پرداخت" do |p|
      p.pay_period
    end
    column "مبلغ-تومان" do |p|
      p.pay_amount
    end
    actions
  end

  show do
    attributes_table  do
      row :id
      row "نام"do |p|
      p.name
    end
    row "ایمیل" do |p|
      p.email_address
    end
    row "شماره موبایل" do |p|
      p.mobile_number
    end
    row "شماره ثابت" do |p|
      p.phone_number
    end
    row "جنسیت" do |p|
      p.gender
    end
    row "شهر سکونت" do |p|
      "#{p.city.state}" + " - " + "#{p.city.name}"
    end
    row "تاریخ تولد" do |p|
      p.birthdate.to_pdate.strftime("%A %d %b %Y") if p.birthdate.present?
    end
    row "شروع دوره" do |p|
      p.pay_start.to_pdate.strftime("%A %d %b %Y")
    end
    row "دوره پرداخت" do |p|
      p.pay_period
    end
    row "مبلغ-تومان" do |p|
      p.pay_amount
    end
    row "شماره حساب دریافت" do |p|
      p.bank_account
    end
  end
  # :name, :email_address,:encrypted_password, :mobile_number,:phone_number,:pay_start,:pay_period,:pay_amount, :gender_id,:city_id,:birthdate,:phone_number
  panel "پرداخت های #{person.name}" do
    table_for person.payments.order("deadline DESC") do
      column "مبلغ-تومان" do |p|
        " #{p.amount.to_i} "
      end
      column "موعد پرداخت" do |p|
        p.deadline.to_pdate.strftime("%A %d %b %Y")
      end
      column "وضعیت پرداخت" do |p|
        p.farsi_status
      end
    end
  end
  active_admin_comments
end


form do |f|
  f.inputs "Person" do
    f.input :name , label: "نام مشترک"
    f.input :email_address , label: "پست الکترونیکی"
    f.input :mobile_number , label: "شماره موبایل"
    f.input :phone_number , label: "شماره ثابت"
    f.input :gender , label: "جنسیت"
    f.input :city , label: "شهر سکونت" , :as => :select, :collection => City.all.order("state").collect {|o| ["#{o.state}-#{o.name}", o.id]}
    f.input :birthdate , :as => :string, :input_html => {:class => 'bd-date'} , label: "تاریخ تولد"
    f.input :pay_start , :as => :string, :input_html => {:class => 'fa-date'}, label: "تاریخ شروع دوره"
    f.input :pay_period , label: "دوره پرداخت"
    f.input :pay_amount , label: "مبلغ پرداخت"
    f.input :bank_account_id , label: "شماره حساب دریافت" , :as => :select, :collection => BankAccount.all.collect {|o| ["#{o.name}", o.id]}
  end
  f.actions
  f.inputs class: "hidden" do
    f.template.render partial: 'person_edit'
  end
end

filter :pay_amount , label: "مبلغ پرداخت"
filter :pay_period, label: "دوره پرداخت"
filter :phone_number, label: "شماره ثابت"
filter :mobile_number, label: "شماره موبایل"
filter :email_address, label: "پست الکترونیکی"
filter :birthdate , label: "تاریخ تولد"
filter :name, label: "نام مشترک"
filter :bank_account , label: "شماره حساب دریافت"
filter :gender, label: "جنسیت"
filter :city, label: "شهر سکونت"
filter :city_state , label: "استان" , :as => :select, :collection => City.all.order("state").distinct.pluck(:state)

# filter :city_id
# filter :pay_amount,as: :string
# filter :pay_period , label: "دوره پرداخت"
# filter :pay_start  , :as => :numeric, label: "تاریخ شروع دوره" , :input_html => {:class => 'fa-date'}
# filter :name
# filter :mobile_number
# filter :phone_number
# filter :email_address
# filter :gender_id
# filter :birthdate

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
