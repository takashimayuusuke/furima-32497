class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new
  end
end

