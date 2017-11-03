class Me::PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  helper_method :current_post_hit

  def index
    @posts = current_user.posts
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to me_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # TODO: Move another
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
    params.require(:post).permit(:published_at, :unknown_content, :impression_content, :status, post_details_attributes: [:id, :project_id, :spent_time, :content, :_destroy])
  end
end
