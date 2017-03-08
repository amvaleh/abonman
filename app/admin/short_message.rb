ActiveAdmin.register ShortMessage do

  permit_params :person,:content , :sms_status_id ,:response , :created_at

  menu label: "پیامک های ارسال شده" ,priority: 40

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

  index  :title => 'پیامک های ارسال شده' do
    selectable_column
    column "مشترک" do |p|
      p.person
    end
    column "متن" do |p|
      p.content
    end
    column "وضعیت" do |p|
      p.response
    end
    column "تاریخ ارسال" do |p|
      p.created_at.to_date.to_pdate.strftime("%A %d %b %Y")
    end
  end


end
