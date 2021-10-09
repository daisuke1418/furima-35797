class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.saveredirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_destination).params(:postal_code, :prefecture, :municipalities, :house_number, :building_name, :telephone_number).merge(:user_id: current_user.id, :item_id)
  end
  
end
