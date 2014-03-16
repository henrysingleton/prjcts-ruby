# Tell omniauth to use the rails logger
OmniAuth.config.logger = Rails.logger

# Make sure facebook app id and secret are set in the env config vars. 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end