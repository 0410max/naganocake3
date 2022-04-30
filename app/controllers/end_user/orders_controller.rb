class EndUser::OrdersController < ApplicationController
  def new
    @order = Order.new    
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == 0
      @order.ship_code = current_end_user.postcode
      @order.ship_address = current_end_user.address
      @order.ship_name = current_end_user.first_name + current_end_user.last_name
    elsif params[:order][:select_address] == 1
      @address = Address.find(params[:order][:address_id])
      @order.ship_code = @address.postcode
      @order.ship_address = @address.address
      @order.ship_name = @address.first_name + @address.last_name
    else
      @order.ship_code = params[:ship_code]
      @order.ship_address = params[:ship_address]
      @order.ship_name = params[:ship_name]
    end
    redirect_to orders_confirm_path
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:pay_way,:ship_code,:ship_address,:ship_name)
  end
end
