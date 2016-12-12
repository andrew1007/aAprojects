class CommentsController < ApplicationController
  before_action :ensure_signed_in

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = ["Sdfadsf"]
      redirect_to link_url(@comment.link_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment.link_id)
  end

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end

end
