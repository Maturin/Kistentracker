module OverviewsHelper
  def logged_in?
    return !session[:user_id].nil?
  end
end