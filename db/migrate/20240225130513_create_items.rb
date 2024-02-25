class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string  :items_name,         null: false
      t.text    :explanation,        null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :number_of_day_id,   null: false
      t.integer :price,              null: false
      t.timestamps
    end
  end
end
