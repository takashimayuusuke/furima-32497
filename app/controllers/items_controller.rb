class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])

  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation_category_id, :explanation_condition_id, :delivery_fee_id,
                                 :shipment_source_address_id, :shipment_day_id, :explanation, :price, :image).merge(user_id: current_user.id)
  end
end
