require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '#create' do
    before do
      @order_item = FactoryBot.build(:order_item)
    end

    context '商品購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_item).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it "tokenが空では登録できないこと" do
        @order_item.token =  ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_numが空だと保存できないこと' do
        @order_item.post_num =  ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_item.post_num =  "1112222"
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @order_item.prefecture_id = 1
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_item.city =  ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("City can't be blank")
      end
      it 'detailsが空だと保存できないこと' do
        @order_item.details =  ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Details can't be blank")
      end
      it 'build_numは空でも保存できること' do
        @order_item.build_num =  ""
        expect(@order_item).to be_valid
      end
      it 'phone_numが空だと保存できないこと' do
        @order_item.phone_num =  ""
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが全角数字だと保存できないこと' do
        @order_item.phone_num =  "１１１２２２２３３３３"
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが12文字以上だと保存できないこと' do
        @order_item.phone_num =  "111133335555"
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
      end
    end
  end
end