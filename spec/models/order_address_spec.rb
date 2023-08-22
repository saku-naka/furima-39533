require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入の記録' do
    context '商品の購入の際配送先の保存ができる場合' do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end
      it "建物が空でも購入できる" do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号がない場合は保存されない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は「3行ハイフン4行の半角文字列」以外では保存されない' do
        @order_address.post_code = 123_4567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
        it '都道府県が「ーーー」の場合は保存されない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村が未記入の場合は保存されない' do
        @order_address.municipality = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が未記入の場合は保存されない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が未記入の場合は保存されない' do
        @order_address.phone_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号が「10桁以上11桁以内の半角数値」以外では保存されない' do
        @order_address.phone_num = '123-4567-8910'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が９桁以下では保存されない' do
        @order_address.phone_num = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が１２桁以上では保存されない' do
        @order_address.phone_num = '1234567891234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に半角数字以外が含まれている場合は保存されない（※半角数字以外が一文字でも含まれていれば良い）' do
        @order_address.phone_num = '0901234567８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていなければ購入できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
    

    