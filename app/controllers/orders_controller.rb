class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new
  end
  
  def create
    @buy_shipping =BuyShipping.new(buy_shipping_params)
    if @buy_shipping.valid?
      @buy_shipping.save
      redirect_to root_path(@buy_shipping)
    else
      render action: :index
  end
end

private

def buy_shipping_params
  params.require(:buy_shipping).permit(:user, :item, :postal_code, :shipment_source_address_id,:municipality, :address, :building, :phone, :buy)
end
