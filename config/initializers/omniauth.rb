OmniAuth.config.logger = Rails.logger

Live::Application.config.middleware.use OmniAuth::Builder do
  provider :xing, ENV['XING_CONSUMER_KEY'], ENV['XING_CONSUMER_SECRET']
end