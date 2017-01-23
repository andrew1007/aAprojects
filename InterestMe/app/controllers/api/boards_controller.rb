class Api::BoardsController < ApplicationController
  helper_method :current_user

  def new
    @board = Board.new()
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      'blank'
    else
      render json: @board.errors.full_messages, status: 422
    end
  end

  def edit
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(board_params)
      render 'blank'
    else
      render json: @board.errors.full_messages, status: 422
    end
  end

  def show
    @board = Board.find(params[:id])
    @current_user = current_user
    @board_pins = @board.pins
    render :show
  end

  def destroy
    @board = Board.find(params[:id])
    if @board
      @board.destroy
      render 'blank'
    else
      render json: @board.errors.full_messages, status: 422
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end
