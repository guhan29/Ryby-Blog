# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               ENV["MAIL_HOST"],
    user_name:            ENV['SENDMAIL_USERNAME'],
    password:             ENV['SENDMAIL_PASSWORD'],
    authentication:       'plain',
    # enable_starttls_auto: true
}
ActionMailer::Base.delivery_method = :smtp