class PostsController < ApplicationController

  def new
    @post = Post.new
    # @subreddit = Sub.find_by(id: params[:sub_id])
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to subs_url
    else
      # fail
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)

    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
