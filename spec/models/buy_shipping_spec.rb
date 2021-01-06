require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  describe '商品購入情報の保存' do
    before do
      @buy_shipping = FactoryBot.build(:buy_shipping)
    end

    it '郵便番号、発送先、市区町村、番地、建物名、電話番号、トークンが正しく入力されていれば保存できる' do
      expect(@buy_shipping).to be_valid
    end
    it '建物名が空でも登録できる'do
      @buy_shipping.building = ''
      expect(@buy_shipping).to be_valid
    end
    it 'トークンが空では登録できない' do
      @buy_shipping.token = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では保存できない' do
      @buy_shipping.postal_code = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと保存できない' do
      @buy_shipping.postal_code = '1234567'
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'shipment_source_address_idが空では登録できない' do
      @buy_shipping.shipment_source_address_id = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Shipment source address can't be blank")
    end

    it 'shipment_source_address_idが1では登録できない' do
      @buy_shipping.shipment_source_address_id = 1
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Shipment source address Shipment source address is not a number')
    end

    it 'municipalityが空では登録できない' do
      @buy_shipping.municipality = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空では登録できない' do
      @buy_shipping.address = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Address can't be blank")
    end

    it 'phoneが空では登録できない' do
      @buy_shipping.phone = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Phone can't be blank")
    end

    it 'phoneが11桁以内でないと登録できない'do
      @buy_shipping.phone = '090123456789'
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Phone is invalid")
    end

    it 'phoneにハイフンが含まれていると登録できない' do
      @buy_shipping.phone = '090-1234-5678'
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Phone is invalid')
    end
  end
end
