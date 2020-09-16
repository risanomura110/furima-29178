require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email、password,password_confirmation,family_kanji,first_kanji,family_kana,first_kana,birthday が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'abc123@gmail.com'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合、6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'ユーザー本名が名字と名前それぞれあれば登録できる' do
        @user.family_kanji = '山田'
        @user.first_kanji = '太郎'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は全角（漢字、ひらがな、カタカナ）であれば登録できる' do
        @user.family_kanji = '漢字ひらがなカタカナ'
        @user.first_kanji = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名フリガナが名字と名前それぞれあれば登録できる' do
        @user.family_kana = 'ヤマダ'
        @user.first_kana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナは全角（カタカナ）であれば登録できる' do
        @user.family_kana = 'カタカナ'
        @user.first_kana = 'カタカナ'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに[@]を含まないと登録できない' do
        @user.email = 'aiueogmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードは不正な値です', 'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordは半角英字のみだと登録できない' do
        @user.password = 'aiueok'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは不正な値です')
      end
      it 'passwordは半角数字のみだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは不正な値です')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは6文字以上で入力してください', 'パスワードは不正な値です')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      # /////＜ユーザー本名・漢字＞/////

      it '名前が存在しても名字が空では登録できない' do
        @user.family_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)を入力してください', '名字(全角)は不正な値です')
      end
      it '名字が存在しても名前が空では登録できない' do
        @user.first_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（全角）を入力してください', '名前（全角）は不正な値です')
      end
      it 'ユーザー本名は半角英字だと登録できない' do
        @user.family_kanji = 'sss'
        @user.first_kanji = 'sss'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です', '名前（全角）は不正な値です')
      end
      it 'ユーザー本名は半角数字だと登録できない' do
        @user.family_kanji = '111'
        @user.first_kanji = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です', '名前（全角）は不正な値です')
      end
      it 'ユーザー本名は半角記号だと登録できない' do
        @user.family_kanji = '???'
        @user.first_kanji = '???'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です', '名前（全角）は不正な値です')
      end
      it 'ユーザー本名は全角英字だと登録できない' do
        @user.family_kanji = 'ａ'
        @user.first_kanji = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です', '名前（全角）は不正な値です')
      end
      it 'ユーザー本名は全角数字だと登録できない' do
        @user.family_kanji = '１'
        @user.first_kanji = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です', '名前（全角）は不正な値です')
      end
      it 'ユーザー本名は全角記号だと登録できない' do
        @user.family_kanji = '・・・'
        @user.first_kanji = '・・・'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です', '名前（全角）は不正な値です')
      end
      # /////＜ユーザー本名・カタカナ＞/////
      it '名前(カタカナ)が存在しても名字（カタカナ）が空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）を入力してください', '名字カナ（全角）は不正な値です')
      end
      it '名字（カタカナ）が存在しても名前（カタカナ）が空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナ（全角）を入力してください', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは漢字だと登録できない' do
        @user.family_kana = '山田'
        @user.first_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは平仮名だと登録できない' do
        @user.family_kana = 'やまだ'
        @user.first_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは半角数字だと登録できない' do
        @user.family_kana = '123'
        @user.first_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは全角数字だと登録できない' do
        @user.family_kana = '１１１'
        @user.first_kana = '１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは半角記号だと登録できない' do
        @user.family_kana = '???'
        @user.first_kana = '???'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは全角記号だと登録できない' do
        @user.family_kana = '・・・'
        @user.first_kana = '・・・'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは半角英字だと登録できない' do
        @user.family_kana = 'yamada'
        @user.first_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      it 'ユーザー本名のフリガナは全角英字だと登録できない' do
        @user.family_kana = 'ｙａｍａｄａ'
        @user.first_kana = 'ｔａｒｏｕ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です', '名前カナ（全角）は不正な値です')
      end
      # /////生年月日/////
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end
    end
  end
end

# binding.pry
