class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :set_i18n_locale_from_params
  
  protect_from_forgery

  include ApplicationHelper

  protected

  def set_i18n_locale_from_params
    #@response.headers["Content-Type"] = "text/html; charset=utf-8"

    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { :locale => I18n.locale }
  end

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
