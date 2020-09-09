require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '購入機能' do
    context '購入がうまくいく時' do
      it '要素全てが存在すれば登録できる' do
        expect(@address).to be_valid
      end
    end
    context '購入が失敗する時' do
      it '郵便番号の情報がないと保存できない' do
         @address.postal = nil
         @address.valid?
         expect(@address.errors.full_messages).to include("Postal can't be blank")
      end
      it '電話番号の情報がないと保存できない' do
        @address.phone = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone can't be blank")
     end
     it '都道府県の情報がないと保存できない' do
      @address.prefecture = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank")
     end
     it '市区町村の情報がないと保存できない' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
     end
     it '番地の情報がないと保存できない' do
      @address.add = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Add can't be blank")
     end


     it '郵便番号にはハイフンがないと保存できない' do
      @address.postal = '111111'
      @address.valid?
      binding.pry
      expect(@address.errors.full_messages).to include('Postal is invalid')
    end
     it '電話番号にはハイフンは不要で、11桁以内ではないときは保存できない' do
      @address.phone = 'あああ'
      @address.valid?
      expect(@address.errors.full_messages).to include('Phone is invalid')
    end

    end
  end
end
