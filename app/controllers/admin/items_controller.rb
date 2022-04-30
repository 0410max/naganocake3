class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
        redirect_to admin_items_path
    else
        @genres = Genre.all
        render :edit
    end
  end

  def search
    if params[:name].present?
      @items = Item.where('name LIKE ?',"%#{params[:name]}%")
    else
      @items = Item.none
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:notax_money,:is_sale)
  end

end