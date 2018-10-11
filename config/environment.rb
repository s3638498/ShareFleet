# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#Change the host to where the link will forward the user to when they click the link
ActionMailer::Base.default_url_options = { :host => 'share-fleets.herokuapp.com' }
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :user_name => 'share-fleets',
    :password => 'Password!23',
    :domain => 'smtp.sendgrid.net',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
