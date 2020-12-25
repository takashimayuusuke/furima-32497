require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context "出品商品が保存できる場合" do
      it "商品名、商品画像１枚、商品説明、カテゴリー情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格、価格の範囲が適性であれば保存できる" do
        expect(@item).to be_valid
      end
    end
    context "出品商品が保存できない場合" do
      it "nameが空では保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品説明がないと保存できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")

      end
      it "カテゴリー情報がないと保存できない"do
      @item.explanation_category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation category is not a number")

      end
      it "商品の状態がないと登録できない" do
        @item.explanation_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation condition is not a number")
        
      end
      it "配送料の負担がないと登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
        
      end
      it "発送元の地域がないと保存できない" do
        @item.shipment_source_address_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source address is not a number")
        
      end
      it "発送までの日数がないと保存できない" do
        @item.shipment_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment day is not a number")
        
      end
      it "価格がないと保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
        
      end
      it "価格の加減はが299以上でないと登録できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")

      end
      it "価格の上限が1000000以下でないと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")

      end
      it "価格は半角英数字でないと登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")

      end
    end
  end
end