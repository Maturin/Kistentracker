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

  def need_admin_priveledge
    unless admin_priveledge?
      redirect_to '/', :notice => "Die noetigen Rechte fehlen."
    end
  end

  def need_crate_priveledge
    unless crate_priveledge?
      redirect_to '/', :notice => "Die noetigen Rechte fehlen."
    end
  end

end
