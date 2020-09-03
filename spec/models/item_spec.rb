require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it '要素全てが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
#       it 'emailに@が含まれていれば登録できる' do
#         @item.email = 'abc123@gmail.com'
#         expect(@item).to be_valid
#       end
#       it 'passwordが半角英数字混合、6文字以上であれば登録できる' do
#         @user.password = 'abc123'
#         @user.password_confirmation = 'abc123'
#         expect(@item).to be_valid
#       end
#       it 'ユーザー本名が名字と名前それぞれあれば登録できる' do
#         @user.family_kanji = '山田'
#         @user.first_kanji = '太郎'
#         expect(@item).to be_valid
#       end
#       it 'ユーザー本名は全角（漢字、ひらがな、カタカナ）であれば登録できる' do
#         @user.family_kanji = '漢字ひらがなカタカナ'
#         @user.first_kanji = '漢字ひらがなカタカナ'
#         expect(@item).to be_valid
#       end
#       it 'ユーザー本名フリガナが名字と名前それぞれあれば登録できる' do
#         @item.family_kana = 'ヤマダ'
#         @user.first_kana = 'タロウ'
#         expect(@item).to be_valid
#       end
#       it 'ユーザー本名のフリガナは全角（カタカナ）であれば登録できる' do
#         @user.family_kana = 'カタカナ'
#         @user.first_kana = 'カタカナ'
#         expect(@user).to be_valid
#       end
#     end
#     context '新規登録がうまくいかないとき' do
#       it 'nicknameが空だと登録できない' do
#         @user.nickname = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Nickname can't be blank")
#       end
#       it 'emailが空では登録できない' do
#         @user.email = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Email can't be blank")
#       end
#       it '重複したemailが存在する場合登録できない' do
#         @user.save
#         another_user = FactoryBot.build(:user)
#         another_user.email = @user.email
#         another_user.valid?
#         expect(another_user.errors.full_messages).to include('Email has already been taken')
#       end
#       it 'emailに[@]を含まないと登録できない' do
#         @user.email = 'aiueogmail.com'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Email is invalid')
#       end
#       it 'passwordが空では登録できない' do
#         @user.password = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Password can't be blank")
#       end
#       it 'passwordは半角英字のみだと登録できない' do
#         @user.password = 'aiueok'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Password is invalid')
#       end
#       it 'passwordは半角数字のみだと登録できない' do
#         @user.password = '123456'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Password is invalid')
#       end
#       it 'passwordが5文字以下であれば登録できない' do
#         @user.password = 'aaaaa'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
#       end
#       it 'passwordが存在してもpassword_confirmationが空では登録できない' do
#         @user.password_confirmation = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
#       end
#       # /////＜ユーザー本名・漢字＞/////

#       it '名前が存在しても名字が空では登録できない' do
#         @user.family_kanji = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Family kanji can't be blank", 'Family kanji is invalid')
#       end
#       it '名字が存在しても名前が空では登録できない' do
#         @user.first_kanji = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("First kanji can't be blank", 'First kanji is invalid')
#       end
#       it 'ユーザー本名は半角英字だと登録できない' do
#         @user.family_kanji = 'sss'
#         @user.first_kanji = 'sss'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kanji is invalid', 'First kanji is invalid')
#       end
#       it 'ユーザー本名は半角数字だと登録できない' do
#         @user.family_kanji = '111'
#         @user.first_kanji = '111'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kanji is invalid', 'First kanji is invalid')
#       end
#       it 'ユーザー本名は半角記号だと登録できない' do
#         @user.family_kanji = '???'
#         @user.first_kanji = '???'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kanji is invalid', 'First kanji is invalid')
#       end
#       it 'ユーザー本名は全角英字だと登録できない' do
#         @user.family_kanji = 'ａ'
#         @user.first_kanji = 'ａ'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kanji is invalid', 'First kanji is invalid')
#       end
#       it 'ユーザー本名は全角数字だと登録できない' do
#         @user.family_kanji = '１'
#         @user.first_kanji = '１'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kanji is invalid', 'First kanji is invalid')
#       end
#       it 'ユーザー本名は全角記号だと登録できない' do
#         @user.family_kanji = '・・・'
#         @user.first_kanji = '・・・'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kanji is invalid', 'First kanji is invalid')
#       end
#       # /////＜ユーザー本名・カタカナ＞/////
#       it '名前(カタカナ)が存在しても名字（カタカナ）が空では登録できない' do
#         @user.family_kana = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Family kana can't be blank", 'Family kana is invalid')
#       end
#       it '名字（カタカナ）が存在しても名前（カタカナ）が空では登録できない' do
#         @user.first_kana = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("First kana can't be blank", 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは漢字だと登録できない' do
#         @user.family_kana = '山田'
#         @user.first_kana = '太郎'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは平仮名だと登録できない' do
#         @user.family_kana = 'やまだ'
#         @user.first_kana = 'たろう'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは半角数字だと登録できない' do
#         @user.family_kana = '123'
#         @user.first_kana = '123'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは全角数字だと登録できない' do
#         @user.family_kana = '１１１'
#         @user.first_kana = '１１１'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは半角記号だと登録できない' do
#         @user.family_kana = '???'
#         @user.first_kana = '???'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは全角記号だと登録できない' do
#         @user.family_kana = '・・・'
#         @user.first_kana = '・・・'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは半角英字だと登録できない' do
#         @user.family_kana = 'yamada'
#         @user.first_kana = 'tarou'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       it 'ユーザー本名のフリガナは全角英字だと登録できない' do
#         @user.family_kana = 'ｙａｍａｄａ'
#         @user.first_kana = 'ｔａｒｏｕ'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family kana is invalid', 'First kana is invalid')
#       end
#       # /////生年月日/////
#       it '生年月日が空では登録できない' do
#         @user.birthday = ''
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Birthday can't be blank")
#       end
#     end
#   end
# end

# # binding.pry
