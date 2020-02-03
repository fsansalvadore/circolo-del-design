class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [
    :index,
    :new,
    :create
  ]
  # def new
  #   @contact = Contact.new
  # end

  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # flash.now[:error] = nil
        # re-initialize Home object for cleared form
        @contact = Contact.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Grazie per il messaggio! Cercheremo di rispondere in breve tempo." }
      else
        # flash.now[:error] = "Non è possibile inviare il messaggio al momento."
        # render :new
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Non è possibile inviare il messaggio al momento." }
      end
    end
  end
end
