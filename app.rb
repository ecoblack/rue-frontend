require 'rack/cors'
require 'byebug'
require_relative "./services/damage/physical.rb"
require "trailblazer/operation"
require 'rack'

class App
  debugger
  def self.call(env)
    debugger
    req = Rack::Request.new(env)
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