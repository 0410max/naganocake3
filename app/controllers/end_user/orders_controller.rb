class EndUser::OrdersController < ApplicationController
  def new
    @order = Order.new    
  end

  def index
  end

  def show
  end

  def confirm
    @orders = current_end_user.cart_items
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.ship_code = current_end_user.postcode
      @order.ship_address = current_end_user.address
      @order.ship_name = current_end_user.first_name + current_end_user.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.ship_code = @address.postcode
      @order.ship_address = @address.address
      @order.ship_name = @address.name
    else
      @order.ship_code = params[:order][:ship_code]
      @order.ship_address = params[:order][:ship_address]
      @order.ship_name = params[:order][:ship_name] 
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.send_cost = 800
    if @order.save!
      cart_items = current_end_user.cart_items
      cart_items.each do |cart_item|  
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.with_tax_price
        order_detail.save
      end
      current_end_user.cart_items.destroy_all
      redirect_to orders_complete_path
    else 
      @orders = current_end_user.cart_items
      render :confirm
    end
  end

  private

  def order_params
    params.require(:order).permit(:pay_way,:ship_code,:ship_address,:ship_name,:total_money,:send_cost)
  end
end
