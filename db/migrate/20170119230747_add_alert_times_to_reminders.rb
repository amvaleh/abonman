class AddAlertTimesToReminders < ActiveRecord::Migration[5.0]
  def change
    add_column :reminders, :alert_times, :integer , default: 0
  end
end
