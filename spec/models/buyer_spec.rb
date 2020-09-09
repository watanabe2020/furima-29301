require 'rails_helper'

RSpec.describe UserInformation, type: :model do
  describe '商品購入機能' do
    before do
    @user =  FactoryBot.create(:user)
    @item =  FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @buyer = FactoryBot.build(:user_information, user_id:  @user.id ,item_id: @item.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer).to be_valid
    end


    it '郵便番号が空白だと購入できない' do

        @buyer.postcode = ''
        @buyer.valid?
        
        
        expect(@buyer.errors.full_messages).to include("Postcode can't be blank", "Postcode 半角文字で入力してください")

    end

    it '郵便番号にハイフンがないと購入できない' do
        @buyer.postcode = '0000000'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postcode 半角文字で入力してください")

    end

    it '都道府県が＿＿だと購入できない' do
      @buyer.ship_from_id  = '__'
        @buyer.valid?
        
        
        
        expect(@buyer.errors.full_messages).to include("Ship from is not a number")

    end
    it '市区町村が空だと購入できない' do
      @buyer.city  = ''
        @buyer.valid?
        
        
        
        expect(@buyer.errors.full_messages).to include("City can't be blank")

    end

    it '全角でしか入力できない' do
      @buyer.city = 'aaaaa'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City 全角で入力してください")
      
    end

    it '番地が空だと購入できない' do
      @buyer.block = ''
        @buyer.valid?
        
        
        
        expect(@buyer.errors.full_messages).to include("Block can't be blank")
      
    end
    it '電話番号が空だと購入できない' do
      @buyer.phone_number = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank", "Phone number 半角数字で入力してください")
      
    end

    it 'トークンが空だと購入できない' do
      
      @buyer.token = ''
        @buyer.valid?
        
        
        
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
    end


   end
  end

  # bundle exec rspec spec/models/buyer_spec.rb 


  # user.errors.full_messages
