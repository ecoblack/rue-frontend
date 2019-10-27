require 'byebug'
require_relative "./services/damage/physical/deal.rb"
require "trailblazer/operation"

class App
  def self.call(env)

    req = Rack::Request.new(env)
    debugger
    data = env['rack.input'].read
    req.post?
    #request_data = JSON.parse(data) if data
    result = Physical::Deal.(amount: 2131)
    puts result['total']
    case req.path_info
    when /cors/
      [200, {"Content-Type" => "text/json"}, ["Hello World!"], ["#{result['total']}"]]
    when /cors2/
      [500, {"Content-Type" => "text/html"}, ["Goodbye Cruel World!"]]
    else
      [404, {"Content-Type" => "text/html"}, ["I'm Lost!"]]
    end
  end
end
