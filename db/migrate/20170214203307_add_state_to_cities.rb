class AddStateToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :state, :string
  end
end
