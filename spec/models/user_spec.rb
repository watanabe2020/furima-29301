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
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'nicknameが半角英数でないと保存できないこと' do
      @user.nickname = 'すずき'
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname 半角文字で入力してください')
    end

    it 'emailが空だと保存できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '@マークがないと保存できないこと' do
      @user.email = '@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角で入力してください')
    end

    it 'first_nameが空だと保存できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角で入力してください')
    end

    it 'last_nameが全角日本語でないと保存できないこと' do
      @user.last_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角で入力してください')
    end

    it 'last_nameが空だと保存できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角で入力してください')
    end

    it 'first_nameがカタカナでないと保存できないこと' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana カタカナで入力してください')
    end

    it 'first_name_kanaが空だと保存できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana カタカナで入力してください')
    end

    it 'last_nameがカタカナでないと保存できないこと' do
      @user.last_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana カタカナで入力してください')
    end

    it 'last_name_kanaが空だと保存できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana カタカナで入力してください')
    end

    it 'berthdayが空だと保存できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    # @user.errors
    # @user.errors.full_messages
  end
end
