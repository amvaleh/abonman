class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :person_id
      t.integer :payment_status_id , default: 1
      t.decimal :amount

      t.timestamps
    end
  end
end
