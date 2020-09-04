class ItemsController < ApplicationController
  before_action only:[:edit, :show, :update, :destroy]
  def index
    @items  = Item.all.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @item  = Item.where(id:params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(user_params)
        redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
    redirect_to root_path
    else
    render 'show'
    end
  end

  private

  def user_params
    params.require(:item).permit(:name, :price, :product_description, :category_id, :product_status_id, :postage_id, :ship_from_id, :date_of_shipment_id,:content, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  
end
