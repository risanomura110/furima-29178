class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal,     default: "",  null: false
      t.integer :prefecture_id,           null: false
      t.string :city,       default: "",  null: false
      t.string :add,        default: "",  null: false
      t.string :building,   default: ""  
      t.references :order,  null: false,  foreign_key: true
      t.timestamps
    end
  end
end
