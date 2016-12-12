class ContactsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @contact = ContactShare.where(user_id: @user.id)
    uses = @contact.map { |i| i.contact }
    render json: [@user.username, uses]
  end

  def create
    @contact_new = Contact.new(contact_params)
    if @contact_new.save
      render json: @contact_new
    else
      render(
      jason: @contact_new.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @showed_contact = Contact.find(params[:id])
    render json: @showed_contact
  end

  def update
    @update_contact = Contact.find(params[:id])
    if @update_contact.update(user_params)
      render json: @update_contact
    else
      render( json: @update_contact.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
