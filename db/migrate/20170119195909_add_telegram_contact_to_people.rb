class AddTelegramContactToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :telegram_contact, :string
  end
end
