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

  def self.index
    render_view('index.html')
  end

   def self.error
    ['404', {'Content-Type' => 'text/html'}, [File.read('./app/views/error.html')]]
  end

  def self.render_view(page, code = '200')
  [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}")]]
  end
end
