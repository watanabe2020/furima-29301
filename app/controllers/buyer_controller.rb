class BuyerController < ApplicationController
  before_action :move_to_index
  before_action :current_user_cant_buy

  def index
    @buyer = Item.find(params[:item_id])
  end

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.create(buyer_paeams)
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

  def buyer_paeams
    params.require(:buyer).permit().merge(:postcode,:ship_from_id,:city,:block,:building,:phone_number)
  end

end