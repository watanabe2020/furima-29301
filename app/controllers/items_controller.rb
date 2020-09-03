class ItemsController < ApplicationController
  def index
    @items  = Item.all
    # @items =Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(user_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  def update

  end

  def destroy
    
  end

  private

  def user_params
    params.require(:item).permit(:name, :price, :product_description, :category_id, :product_status_id, :postage_id, :ship_from_id, :date_of_shipment_id,:content, :image).merge(user_id: current_user.id)
  
  end
  
  
end
