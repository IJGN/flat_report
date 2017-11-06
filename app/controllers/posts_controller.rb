class PostsController < ApplicationController
  before_action :set_post, only: :show

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = current_user.team.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:published_at, :unknown_content, :impression_content, :status, post_details_attributes: [:id, :project_id, :spent_time, :content, :_destroy])
  end
end
