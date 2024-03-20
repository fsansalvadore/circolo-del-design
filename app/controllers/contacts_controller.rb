class ContactsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

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

    from = Email.new(email: 'hello@fsansalvadore.com')
    to = Email.new(email: @contact.email)
    subject = 'Messaggio da form contatti'
    content = Content.new(type: 'text/plain', value: @contact.messaggio)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_PASSWORD'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
    # @contact.request = request
    # if @contact.deliver
    #   flash[:success] = 'Messaggio inviato con successo'
    #   flash.now[:error] = nil
    #   redirect_to contatti_path
    # else
    #   flash.now[:error] = 'Impossibile inviare il messaggio al momento.'
    #   render :index
    # end
  end

  private

  def contact_params
    params.require(:contact).permit(:nome, :email, :messaggio, :nickname)
  end
end
