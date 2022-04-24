class EndUser::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    @genres = Genre.all
    @items = Item.where(genre_id:params[:genre_id])
  end
  
end
