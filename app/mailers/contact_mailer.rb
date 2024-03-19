class ContactMailer < ApplicationMailer
  # default from: 'info@circolodeldesign.it'
  default from: 'hello@fsansalvadore.com'

  def form_contatti
    @contact = params[:contact]
    
    mail(
      from: @contact.email,
      to: 'hello@fsansalvadore.com', 
      subject: 'Form contatti: nuovo messaggio da ' + @contact.nome
    )
  end
end
