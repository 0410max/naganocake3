class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :new
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:notax_money,:is_sale)
  end

end
