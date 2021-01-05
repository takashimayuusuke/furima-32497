class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buy_shipping =BuyShipping.new(buy_shipping_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      redirect_to root_path(@buy_shipping)
    else
      render action: :index
    end
  end

  private

  def buy_shipping_params
    params.require(:buy_shipping).permit(:postal_code, :shipment_source_address_id,:municipality, :address, :building, :phone,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_"
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_shipping_params[:token],
      currency: 'jpy'
    )

  end
end
