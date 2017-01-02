class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.integer :person_id
      t.date :sms_date
      t.integer :sms_status_id

      t.timestamps
    end
  end
end
