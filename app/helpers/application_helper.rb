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

  def user_name
    user_name = ''

    if logged_in?
      tm = Teammate.find_by_id(session[:user_id])
      user_name = tm.cratepayer.name
    end

    return user_name
  end

end
