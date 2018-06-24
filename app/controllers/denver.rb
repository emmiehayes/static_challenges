require 'rack'

class Denver
  def self.call(env)
    case env["PATH_INFO"]
    when '/'         then index.html
    when '/index'    then about
    when '/main.css' then css
    else
      error
    end
  end
