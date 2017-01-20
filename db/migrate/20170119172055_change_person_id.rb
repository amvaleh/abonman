class ChangePersonId < ActiveRecord::Migration[5.0]
  def change
    rename_column :reminders , :person_id , :payment_id
  end
end
