class BuyerController < ApplicationController
  before_action :move_to_index
  before_action :current_user_cant_buy



  def index
    @buyer = Item.find(params[:item_id])
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

end