class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_making_status_params)
    redirect_to request.referer
  end

  private

  def order_status_params
    params.require(:order).permit(:status)
  end

  def order_detail_making_status_params
    params.require(:order_detail).permit(:making_status)
  end
end
