class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :loading_station, null: true, index: true
      t.belongs_to :unloading_station, null: true, index: true
      t.string :status
    end
  end
end
