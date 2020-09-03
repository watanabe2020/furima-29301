class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:item).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
  end
  
  
end
