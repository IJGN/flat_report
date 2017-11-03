# NOTE: Defined 'members' by routes.rb

class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = current_user.team.users
  end

  def show; end

  def new
    @user = current_user.team.users.new
  end

  def create
    @user = current_user.team.users.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to member_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = current_user.team.users.find(params[:id])
  end
end
