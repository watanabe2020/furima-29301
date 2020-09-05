class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render 'new'
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :price, :product_description, :category_id, :product_status_id, :postage_id, :ship_from_id, :date_of_shipment_id)
  end
end
