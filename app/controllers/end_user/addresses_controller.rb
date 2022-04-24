class EndUser::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_end_user.addresses
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to end_user_addresses_path
    else 
      @addresses = current_end_user.addresses
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to end_user_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to end_user_addresses_path
  end

  private

  def address_params
      params.require(:address).permit(:postcode,:address,:name)
  end
end
