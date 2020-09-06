class BuyerController < ApplicationController
  before_action :move_to_index, except:

  def index
    @buyer = Item.find(params[:item_id])
  end


private
 
  def  move_to_index
    unless user_signed_in?
    redirect_to new_user_session_path 
  end

end

end