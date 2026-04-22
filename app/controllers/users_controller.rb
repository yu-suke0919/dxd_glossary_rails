class UsersController < ApplicationController
  skip_before_action :login_required
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to articles_url, notice: "ユーザー#{@user.name}を登録しました。"
    else
      render :new
    end
  end
  def show
    @user = current_user
    @articles = @user.articles
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
