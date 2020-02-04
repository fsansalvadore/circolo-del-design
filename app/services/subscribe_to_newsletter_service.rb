class SubscribeToNewsletterService
  def initialize(subscriber)
    @subscriber = subscriber
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @audience_id = ENV['MAILCHIMP_AUDIENCE_ID']
  end

  def call
    @gibbon.lists(@audience_id).members.create(
      body: {
        email_address: @subscriber.email,
        status: "subscribed",
        # merge_fields: {
        #   FNAME: @subscriber.first_name,
        #   LNAME: @subscriber.last_name
        # }
      }
    )
  end
end
