class SessionsController < ApplicationController
  skip_before_filter :authorize

  include ApplicationHelper

  def new
  end

  def create
    if user = Teammate.authenticate(params[:user_name], params[:password])
      login(user.id)
      redirect_to '/', :notice => "Benutzer '#{params[:user_name]}' erfolgreich eingelogged."
    else
      redirect_to login_url, :alert => "Ungueltiger Benutzer/Passwort kombination."
    end
  end

  def destroy
    logout
    redirect_to '/', :notice => "Logged out"
  end

end
