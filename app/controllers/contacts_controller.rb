class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [
    :index,
    :new,
    :create
  ]

  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      respond_to do |format|
        # @contact = Contact.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Grazie per il messaggio! Cercheremo di rispondere in breve tempo." }
      end
    else
      respond_to do |format|
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Non è possibile inviare il messaggio al momento." }
      end
    end
  end
end
