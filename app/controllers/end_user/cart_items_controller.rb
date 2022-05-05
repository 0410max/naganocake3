class EndUser::CartItemsController < ApplicationController
    def index 
        @cart_items = current_end_user.cart_items
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_items_path
    end
    
    def create
        @cart_item = current_end_user.cart_items.new(cart_item_params)
        @cart_item.end_user_id = current_end_user.id
        @cart_item_params = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
        if @cart_item_params.present?
            @cart_item_params.update(amount: @cart_item.amount.to_i + @cart_item_params.amount.to_i)
            redirect_to cart_items_path
        else
            @cart_item.save
            redirect_to cart_items_path
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to request.referer
    end

    def destroy_all        
        current_end_user.cart_items.destroy_all
        redirect_to request.referer
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:item_id,:amount)
    end
end