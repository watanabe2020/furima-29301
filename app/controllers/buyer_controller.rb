class BuyerController < ApplicationController
  before_action :move_to_index
  before_action :current_user_cant_buy
  before_action :sold_out_cant_buy

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

  def current_user_cant_buy
    @buyer = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @buyer.user_id
  end

  def sold_out_cant_buy
    redirect_to root_path if @buyer.buyer.present?
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def pay_item
    # @buyer_item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @buyer_item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def buyer_params
    params.require(:user_information).permit(:postcode, :ship_from_id, :city, :block, :building, :phone_number, :token).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end
