class EndUser::CartItemsController < ApplicationController
    def index 
        @cart_items = current_end_user.cart_items
    end

    def destroy
    end
    
    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.save
        redirect_to end_user_cart_items_path
    end

    def update
    end

    def destroy_all
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:item_id,:amount)
    end
end