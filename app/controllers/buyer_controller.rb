class BuyerController < ApplicationController
  before_action :move_to_index
  before_action :current_user_cant_buy

  def index
    @buyer_item = Item.find(params[:item_id])
    @buyer = UserInformation.new
    
  end

  def new
  end

  def create 
    @buyer_item = Item.find(params[:item_id])
    @buyer = UserInformation.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      redirect_to root_path
    else
      render 'index'
    end
  end

private
def  current_user_cant_buy
    @buyer = Item.find(params[:item_id])
    if current_user.id == @buyer.user_id
    redirect_to root_path
    end
end

def  move_to_index
  unless user_signed_in?
    redirect_to new_user_session_path 
  end
end

private

  def buyer_params
    params.require(:user_information).permit(:buyer_id,:postcode,:ship_from_id,:city,:block,:building,:phone_number,:token,:item_id,:user_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: buyer_paeams[:item.price],  
      card: buyer_paeams[:token],    
      currency:'jpy'                 
    )
  end



end