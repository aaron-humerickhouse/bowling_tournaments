# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  :user_name => Settings.email.username, # This is the string literal 'apikey', NOT the ID of your API key
  :password => Settings.email.password, # This is the secret sendgrid API key which was issued during API key creation
  :domain => Settings.site.host,
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}