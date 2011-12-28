class SessionsController < ApplicationController
  def new
  end

  def create
    logger.warn "Here we go"
    if user = Teammate.authenticate(params[:user_name], params[:password])
      session[:user_id] = user.id
      redirect_to '/', :notice => "Benutzer '#{params[:user_name]}' erfolgreich eingelogged."
    else
      redirect_to login_url, :alert => "Ungueltiger Benutzer/Passwort kombination."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "Logged out"
  end

end
