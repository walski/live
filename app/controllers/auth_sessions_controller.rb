class AuthSessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    # user = User.find(4)
    session[:user_id] = user.id
    session[:token] = auth['credentials']['token']
    session[:secret] = auth['credentials']['secret']

    unless user.xing_id
      user.xing_id = File.basename(auth['info']['url'])
      user.save!
    end

    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:secret] = nil
    session[:token] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end