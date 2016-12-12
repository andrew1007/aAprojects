class ContactShareController < ApplicationController

  def create
    @create_contact_share = ContactShare.new(contact_share_params)
    if @create_contact_share.save
      render json: @create_contact_share
    else
      render(json: @create_contact_share.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def destroy
    @contact_share_destroy = ContactShare.find(params[:id])
    render json: @contact_share_destroy.destroy
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end
end
