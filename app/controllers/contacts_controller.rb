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
    forward_contact = {
      nome: @contact.nome,
      email: @contact.email,
      messaggio: @contact.messaggio,
    }

    respond_to do |format|
      if @contact.save
        # Tell the UserMailer to send a welcome email after save
        ContactMailer.with(contact: forward_contact).form_contatti.deliver_later

        format.html {
          flash[:success] = 'Messaggio inviato con successo'
          flash.now[:error] = nil
          # redirect_to(contatti_path, notice: 'contact was successfully created.') 
          redirect_to contatti_path
        }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { 
          flash.now[:error] = 'Impossibile inviare il messaggio al momento.'
          render action: 'new'
        }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
    # @contact.request = request
    # if @contact.deliver
    #   flash[:success] = 'Messaggio inviato con successo'
    #   flash.now[:error] = nil
    #   redirect_to contatti_path
    # else
    #   flash.now[:error] = 'Impossibile inviare il messaggio al momento.'
    #   render :index
    # end

    #   respond_to do |format|
    #     @contact = Contact.new
    #     format.html { render 'index'}
    #     format.js   { flash.now[:success] = @message = "Grazie per il messaggio! Cercheremo di rispondere in breve tempo." }
    #   end
    # else
    #   respond_to do |format|
    #     format.html { render 'index' }
    #     format.js   { flash.now[:error] = @message = "Non è possibile inviare il messaggio al momento." }
    #   end
    # end
  end
end
