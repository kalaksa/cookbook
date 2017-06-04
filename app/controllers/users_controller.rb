class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authenticate_user!
    # authorize! :show, @user
  end

  def index
    @users = User.all
  end
end
