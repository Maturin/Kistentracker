class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  include ApplicationHelper

  protected

  def authorize
    unless logged_in?
      redirect_to login_url, :notice => "Bitte einloggen."
    end
  end
  
end
