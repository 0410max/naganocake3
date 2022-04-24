class EndUser::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_end_user.addresses
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to end_user_addresses_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def address_params
      params.require(:address).permit(:postcode,:address,:name)
  end
end
