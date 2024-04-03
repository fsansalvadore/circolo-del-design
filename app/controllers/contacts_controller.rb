class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [
    :index,
    :new,
    :create
  ]

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request

    if @contact.deliver
      flash.now[:error] = nil
      flash[:notice] = 'Messaggio inviato con successo'
      redirect_to contatti_path
    else
      flash.now[:error] = 'Impossibile inviare il messaggio al momento.'
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:nome, :email, :messaggio)
  end
end
