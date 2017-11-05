class Me::Posts::StarsController < ApplicationController

  def index
    @posts = current_user.starred_posts
      .includes(:user)
  end
end
