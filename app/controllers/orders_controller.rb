class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderDestination.new
  end

  def create
    @order = OrderDestination.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:items_id])
  end

end
