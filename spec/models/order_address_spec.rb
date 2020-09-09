require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  describe do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address,
                                        user_id: @user.id, item_id: @item.id)
    end
    it '全て値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end
    it '郵便番号の情報がないと保存できない' do
      @order_address.postal = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal can't be blank")
    end
    it '電話番号の情報がないと保存できない' do
      @order_address.phone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone can't be blank")
    end
    it '都道府県の情報がないと保存できない' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村の情報がないと保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地の情報がないと保存できない' do
      @order_address.add = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Add can't be blank")
    end
    it '郵便番号にはハイフンがないと保存できない' do
      @order_address.postal = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal is invalid')
    end
    it '郵便番号が英字だと保存できない' do
      @order_address.postal = 'gesgae'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal is invalid')
    end
    it '電話番号が英字だと保存できない' do
      @order_address.phone = 'dldnk'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone is invalid')
    end
  end
end
