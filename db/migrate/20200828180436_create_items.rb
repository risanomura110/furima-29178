class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,     null: false
      t.text :info,            null: false
      t.integer :category_id,  null: false
      t.integer :status_id,    null: false
      t.integer :shipping_id,  null: false
      t.integer :area_id,      null: false
      t.integer :schedule_id,  null: false
      t.integer :price,        null: false
      t.integer :tax,          null: false
      t.integer :profit,       null: false
      t.integer :user_id,      null: false
      t.timestamps
    end
  end
end
