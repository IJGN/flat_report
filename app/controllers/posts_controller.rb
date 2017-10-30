class PostsController < ApplicationController
  before_action :set_post, only: :show

  helper_method :current_post_hit

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

  def current_post_hit
    hit = cookies['post_hit'].to_i
    hit += 1
    cookies['post_hit'] = hit
    hit
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:published_at, :unknown_content, :impression_content, :status)
  end
end
