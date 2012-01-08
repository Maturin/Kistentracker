module ApplicationHelper

  def login(id)
    session[:user_id] = id
  end

  def logout
    session[:user_id] = nil
  end

  def logged_in?
    return !session[:user_id].nil?
  end

  def admin_priveledge?
    return (!session[:user_id].nil?) && (session[:user_id] == 1)
  end

  def crate_priveledge?
    return (!session[:user_id].nil?) && (session[:user_id] == 1)
  end

end
