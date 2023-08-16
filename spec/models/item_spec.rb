require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context '出品登録できる場合' do
      it "正常に登録できる" do
        expect(@item).to be_valid
      end
    end
    context '出品登録できない場合' do
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '"カテゴリーが「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態が「---」だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it '配送料の負担が「---」だと出品できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 0")
      end
      it '発送元の地域が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数が「---」だと出品できない' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 0")
      end
      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が、300円～9,999,999円以外だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it'価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = 'abc' 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not a number")  # エラーメッセージを確認
      end
      it'価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it'userが紐付いていなければ出品できない' do
        @item.user = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
