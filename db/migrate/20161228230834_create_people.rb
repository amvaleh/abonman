class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :mobile_number
      t.string :phone_number
      t.date :pay_start
      t.integer :pay_period
      t.decimal :pay_amount
      t.integer :gender_id
      t.integer :city_id

      t.timestamps
    end
  end
end
