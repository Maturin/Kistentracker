class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def loggedin?
    return !session[:user_id].nil?
  end
end
