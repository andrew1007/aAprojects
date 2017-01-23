class Api::PinsController < ApplicationController
  helper_method :current_user

  def index
    pins = Pin.all.shuffle
    if (pins.length > 40)
      @pins = pins[0..39]
    else
      @pins = pins
    end
    render :index
  end

  def new
    @pin = Pin.new()

  end

  def create
    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id
    id_board = @pin.board.id
    if @pin.save
      @pins = Pin.where(:board_id => id_board)
      render :index
    else
      render json: @pin.errors.full_messages, status: 422
    end
  end

  def edit
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      render '/api/boards/#{@pin.board_id}'
    else
      render json: @pin.errors.full_messages, status: 422
    end
  end

  def show
    @board = Board.find(params[:id])
    @current_user = current_user
    @board_pins = @board.pins
    render :show
  end

  def destroy
    @pin = Pin.find(params[:id])
    if @pin
      @pin.destroy
      render 'api/boards/30'
    else
      render json: @pin.errors.full_messages, status: 422
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:board_id, :image_url, :title, :body, :title)
  end
end
