module TeammatesHelper
  def call_to(n)
    link = ""
    n = n.to_s
    if n.size > 0
      link = "<a href=\"callto:#{n}\">#{n}</a>".html_safe
    end
    return link
  end

  def myself?(tm)
    return tm.id == session[:user_id]
  end
end
