class OrderAddress
   include ActiveModel::Model
   attr_accessor :item_id, :user_id, :postal,:prefecture_id,
                 :city, :add, :building, :phone, :order_id
                 #order,addressテーブルのカラム合計
validates :item_id, :user_id, :postal, :prefecture_id, 
          :city, :add, :phone, presence: true
          #order,addressのカラム&&値がないと保存を許可しない（item_idはsaveでcreateするので入れない）
  # def save
  #   @item = Item.create
  #   # 購買履歴orderの情報を保存し、「@order」という変数に入れている
  #   @order = Order.create(item_id:@item.id, user_id:current_user.id)
  #   # 住所の情報を保存
  #   Address.create(postal: postal,
  #                  prefecture: prefecture,
  #                  city: city,
  #                  add: add,
  #                  building: building,
  #                  order_id:@order.id)#ここで保存する
  # end
end
