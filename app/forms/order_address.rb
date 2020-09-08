class OrderAddress
   include ActiveModel::Model
   attr_accessor :item_id, :user_id, :postal,:prefecture_id,
                 :city, :add, :building, :phone, :order_id
                 #order,addressテーブルのカラム合計
validates :item_id, :user_id, :postal, :prefecture_id, 
          :city, :add, :phone, presence: true
          #order,addressのカラム&&値がないと保存を許可しない（item_idはsaveでcreateするので入れない）
  def save
    @item = Item.create
    @user = User.create
    # 購買履歴orderの情報を保存し、「@order」という変数に入れている
    @order = Order.create(user_id: user_id, item_id: item_id)
    # (item_id:@item.id, user_id:current_user.id)
    # 住所の情報を保存
    Address.create(postal: postal,
                   prefecture_id: prefecture_id,
                   city: city,
                   add: add,
                   building: building,
                   order_id:@order.id)#ここで保存する
  end

  
  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
    Donation.create(price: price, user_id: user.id)
  end



end
