class EndUser::CartItemsController < ApplicationController
    def index 
        @cart_items = current_end_user.cart_items
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to end_user_cart_items_path
    end
    
    def create
        if CartItem.find_by(name:params[:name])
        else
        end
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.end_user_id = current_end_user.id
        @cart_item.save
        redirect_to end_user_cart_items_path
    end

    def update
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