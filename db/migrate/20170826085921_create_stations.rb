class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :comp_name1
      t.string :street
      t.string :street_num
      t.string :zip_code
      t.string :city
      t.string :type, null: false
      t.timestamps
    end
  end
end
