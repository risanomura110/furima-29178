class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal, :prefecture_id,
                :city, :add, :building, :phone, :order_id
  # order,addressテーブルのカラム合計
  validates :item_id, :user_id, :postal, :prefecture_id,
            :city, :add, :phone, presence: true
#郵便番号にはハイフンが必要であること
POSTAL_REGEX =  /\A[0-9]{3}-[0-9]{4}\z/.freeze
validates :postal,
    format: { with: POSTAL_REGEX } 
#電話番号にはハイフンは不要で、11桁以内であること  
PHONE_REGEX =  /\A[0-11]+\z/.freeze
validates :phone,
format: { with: PHONE_REGEX } 
with_options numericality: { other_than: 1, message: 'Select' } do
  validates :prefecture_id
end


  # order,addressのカラム&&値がないと保存を許可しない（item_idはsaveでcreateするので入れない）
  def save
    # 購買履歴orderの情報を保存し、「@order」という変数に入れている
    @order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal: postal,
                   prefecture_id: prefecture_id,
                   city: city,
                   add: add,
                   building: building,
                   phone: phone,
                   order_id: @order.id)
  end
end
