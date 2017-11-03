class Users::PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts.order(created_at: :desc)
  end

  private

  def set_user
    @user = current_user.team.users.find(params[:member_id])
  end
end
