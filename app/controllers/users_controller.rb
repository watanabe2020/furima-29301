class UsersController < ApplicationController

def new
    @user = User.new
end

def create
  @user=User.create(user_params)
 if @user.valid?
  @user.save
  return redirect_to root_path
else
  render "new"
end
end
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
  end

end


