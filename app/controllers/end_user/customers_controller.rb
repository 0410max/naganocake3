class EndUser::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_end_user
  end

  def update
    @customer = current_end_user
    @customer.update(customer_params)
    if @customer.save
      redirect_to end_user_customer_path
    else
      render :edit
    end
  end

  def confirm 
  end

  def unsubscribe
    current_end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:end_user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:postcode,:address,:phonenumber)
  end
end
