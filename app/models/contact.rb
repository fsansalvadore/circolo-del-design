class Contact < MailForm::Base
  attribute :nome,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :messaggio, :validate => true
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Messaggio da form contatti",
      # :to => "info@circolodeldesign.it",
      :to => "f.sansalvadore@gmail.com",
      :from => %("#{nome}" <#{email}>)
    }
  end
end
