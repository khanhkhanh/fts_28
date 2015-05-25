class Admin::UsersController < ApplicationController
  before_action :set_user, except: :index

  def index
    @users = User.paginate page: params[:page], per_page: 10
  end

  def destroy
    @user.destroy!
    respond_to do |format|
      format.js
      format.html {redirect_to users_url}
      format.json {head :no_content}
    end
  end

  private
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit :email, :password,
                                 :password_confirmation, :admin
  end
end
