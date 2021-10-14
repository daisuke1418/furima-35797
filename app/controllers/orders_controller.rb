class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_item, only: [:index, :create]
  before_action :block_entry, only: [:index, :new, :create]
  before_action :set_order, only: [:index, :new]

  def index
  end

  def new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_5e01f771baefea568f631a15"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def block_entry
    if @item.order
      redirect_to root_path
    end
  end

  def set_order
    @order_destination = OrderDestination.new
  end
end
