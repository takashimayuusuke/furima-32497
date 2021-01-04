require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  describe '商品購入情報の保存' do
    before do
    @buy_shipping = FactoryBot.build(:buy_shipping)
    end

    it '郵便番号、発送先、市区町村、番地、建物名、電話番号が正しく入力されていれば保存できる'do
      expect(@buy_shipping).to be_valid
    end
    it 'postal_codeが空では保存できない' do
    
    end
    it 'postal_codeにハイフンがないと保存できない' do
    
    end
    it 'shipment_source_address_idが空では登録できない' do
    
    end
    it 'shipment_source_address_idが1では登録できない' do
    
    end
    it 'municipalityが空では登録できない' do
    
    end
    it 'addressが空では登録できない' do
    
    end
    it 'phoneが空では登録できない' do
    
    end
    it 'phoneにハイフンが含まれていると登録できない' do
    end
  end
end
