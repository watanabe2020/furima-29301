require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください", "ニックネームは半角文字で入力してください")
    end

    it 'nicknameが半角英数でないと保存できないこと' do
      @user.nickname = 'すずき'
      @user.valid?
      
      
      expect(@user.errors.full_messages).to include('ニックネームは半角文字で入力してください')
    end

    it 'emailが空だと保存できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it '@マークがないと保存できないこと' do
      @user.email = '11112222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは数字と小文字を必ず1文字使ってください")
    end

    it 'passwoに数字と小文字を必ず1文字使っていないと登録できない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは数字と小文字を必ず1文字使ってください")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は全角で入力してください")
    end

    it 'first_nameが空だと保存できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください", "名字は全角で入力してください")
    end

    it 'last_nameが全角日本語でないと保存できないこと' do
      @user.last_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は全角で入力してください")
    end

    it 'last_nameが空だと保存できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください", "名前は全角で入力してください")
    end

    it 'first_nameがカタカナでないと保存できないこと' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("カタカナで名字で入力してください")
    end

    it 'first_name_kanaが空だと保存できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("カタカナで名字を入力してください", "カタカナで名字で入力してください")
    end

    it 'last_nameがカタカナでないと保存できないこと' do
      @user.last_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("カタカナで名前で入力してください")
    end

    it 'last_name_kanaが空だと保存できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("カタカナで名前を入力してください")
    end

    it 'berthdayが空だと保存できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end

    # @user.errors
    # @user.errors.full_messages
  end
end
