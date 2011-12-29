class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected

  def logged_in?
    return !session[:user_id].nil?
  end

  def authorize
    unless logged_in?
      redirect_to login_url, :notice => "Bitte einloggen."
    end
  end
  
end
