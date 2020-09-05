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
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品名説明が空だと保存できないこと' do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end

    it 'カテゴリーが--だと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態が--だと保存できないこと' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status must be other than 1")
    end

    it '送料が--だと保存できないこと' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end

    it '発送元が--だと保存できないこと' do
      @item.ship_from_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from must be other than 0")
    end

    it '発送日が__だと保存できないこと' do
      @item.date_of_shipment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Date of shipment must be other than 1")
    end

    it '販売価格が空だと保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank",
                                                    'Price is out of setting range',
                                                    "Price can't be blank",
                                                    'Price 半角文字で入力してください')
    end

    it '販売価格が全角だと保存できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが300円未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
