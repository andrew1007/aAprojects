class CommentsController < ApplicationController
  before_action :require_signed_in

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = ["Asdf"]
      redirect_to link_url(@comment.link_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment.link_id)
  end

  def comment_params
    params.require(:comment).permit(:link_id, :body)
  end
end
