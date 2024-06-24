class UsersController < ApplicationController
  before_action :find_user,only: [:show]
  def index
    @users=User.paginate(page: params[:page], per_page: 3)
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
     render :index, notice: "User was successfully deleted."
  end

  def show
    @articles=@user.articles.paginate(page: params[:page], per_page: 2)
  end
  private
  def find_user
    @user=User.find(params[:id])
  end
 
end
