require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context "出品商品が保存できる場合" do
      it "商品名、商品画像１枚、商品説明、カテゴリー情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格、価格の範囲が適性であれば保存できる" do
        
      end
    end
    context "出品商品が保存できない場合" do
      it "nameが空では保存できない" do
        
      end
      it "商品の画像がないと保存できない" do

      end
      it "商品説明がないと保存できない" do

      end
      it "カテゴリー情報がないと保存できない"do

      end
      it "商品の状態がないと登録できない" do

      end
      it "配送料の負担がないと登録できない" do

      end
      it "発送元の地域がないと保存できない" do

      end
      it "発送までの日数がないと保存できない" do

      end
      it "価格がないと保存できない" do

      end
      it "価格の範囲が適性でないと登録できない" do

      end
    end
  end
end