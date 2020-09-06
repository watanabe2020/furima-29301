class BuyerController < ApplicationController
  def index
    @buyer = Item.find(params[:item_id])
    
    # binding.pry
    
    
  end


private

end
