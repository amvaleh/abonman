class CreateTelegrams < ActiveRecord::Migration[5.0]
  def change
    create_table :telegrams do |t|
      t.string :teleg_name
      t.string :number
      t.text :message
      t.boolean :read , default: false

      t.timestamps
    end
  end
end
