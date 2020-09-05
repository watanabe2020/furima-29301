require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '商品新規登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it '商品名が空だと保存できないこと' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品名説明が空だと保存できないこと' do
      @item.product_description  = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end

    it 'カテゴリーが空だと保存できないこと' do
      @item.category_id   = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it '商品の状態が空だと保存できないこと' do
      @item.product_status_id   = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank", "Product status is not a number")
    end

    it '送料が空だと保存できないこと' do
      @item.postage_id   = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank", "Postage is not a number")
    end

    it '発送元が空だと保存できないこと' do
      @item.ship_from_id   = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from can't be blank", "Ship from is not a number")
    end

    it '発送日が空だと保存できないこと' do
      @item.date_of_shipment_id   = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Date of shipment can't be blank", "Date of shipment is not a number")
    end

    it '販売価格が空だと保存できないこと' do
      @item.price  = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank",
        "Price is out of setting range",
        "Price can't be blank",
        "Price 半角文字で入力してください")
    end

    it '販売価格が全角だと保存できないこと' do
      @item.price  = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it 'priceが300円未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

  end
end

