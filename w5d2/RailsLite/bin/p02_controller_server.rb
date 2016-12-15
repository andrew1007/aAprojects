require 'rack'
require_relative '../lib/controller_base'

class MyController < ControllerBase
  def go
    if @req.path == "/cats"
      render_content("hello cats!", "text/html")
    else
      redirect_to("/cats")
    end
  end
end

class ControllerBase
  def initialize
    
  end

  def render_content(content, content_type)
    req = Rack::Request.new(content)
    res = Rack::Response.new
    res['Content-Type'] = content_type
    if @already_built_response.nil?
      @already_built_response = res.write(res)
      res.finish
    else
      return
    end
  end

  def redirect_to(url)
    req = Rack::Request.new
    res.status = 302
    res['Location'] = url
    res.finish
  end

end
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end


Rack::Server.start(
  app: app,
  Port: 3000
)
