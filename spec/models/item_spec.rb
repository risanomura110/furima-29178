require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it '要素全てが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品が失敗する時' do
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it '商品名がないと保存できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明がないと保存できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報がないと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryを入力してください", "カテゴリーSelect")
      end
      it '商品の状態についての情報がないと保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Statusを入力してください", "商品の状態Select")
      end
      it '配送料の負担についての情報がないと保存できない' do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingを入力してください", "配送料の負担Select")
      end
      it '発送元の地域についての情報がないと保存できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Areaを入力してください", "発送元の地域Select")
      end
      it '発送までの日数についての情報がないと保存できない' do
        @item.schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduleを入力してください", "発送までの日数Select")
      end
      it '価格についての情報がないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください")
      end
      it '価格の範囲が、¥300より小さい数は保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は299より大きい値にしてください")
      end
      it '価格の範囲が、¥9999999より大きい数は保存できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は10000000より小さい値にしてください")
      end
      it ' 販売価格は英字だと保存できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it ' 販売価格は記号だと保存できない' do
        @item.price = '???'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it ' 販売価格が漢字だと保存できない' do
        @item.price = '日本語'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it ' 販売価格がひらがなだと保存できない' do
        @item.price = 'ひらがな'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it ' 販売価格がカタカナだと保存できない' do
        @item.price = 'カタカナ'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
