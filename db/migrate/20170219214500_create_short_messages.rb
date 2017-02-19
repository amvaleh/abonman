class CreateShortMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :short_messages do |t|
      t.integer :person_id
      t.text :content
      t.integer :sms_status_id
      t.text :response

      t.timestamps
    end
  end
end
