# # require "./app"
require 'rack/cors'
require 'json'
require 'byebug'
class Heartbeat
  def self.call(env)
    req = Rack::Request.new(env)
    x = req.body.read
    puts x
    debugger
    case req.path_info
    when /cors/
      [200, {"Content-Type" => "text/html"}, ["Hello World!"]]
    when /cors2/
      [500, {"Content-Type" => "text/html"}, ["Goodbye Cruel World!"]]
    else
      [404, {"Content-Type" => "text/html"}, ["I'm Lost!"]]
    end
  end
end

app = Rack::Builder.app do
  use Rack::Cors do
    allow do
      origins '*'
      resource '*', :headers => :any, :methods => [:get, :post, :options]
    end
  end
  use Rack::CommonLogger
  run Heartbeat
end

run app