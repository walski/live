class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user
  helper_method :xing_client

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def xing_client
    return unless current_user
    client = Xing::Client.new(:consumer_key => ENV['XING_CONSUMER_KEY'], :consumer_secret => ENV['XING_CONSUMER_SECRET'])
    client.authorize_from_access(session[:token], session[:secret])
    client
  end
end
