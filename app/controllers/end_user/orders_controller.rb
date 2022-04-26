class EndUser::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirm
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:pay_way)
  end

end
