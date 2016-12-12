class CommentsController < ApplicationController
  before_action :require_logged_in

  def new
  end

  def create
    @comment = Comment.new(comment_parmas)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to link_url(@comment.link)
    else
      flash[:errors] = ["asdfasf"]
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment.link_id)
  end

  def comment_parmas
    params.require(:comment).permit(:body, :link_id)
  end

end
