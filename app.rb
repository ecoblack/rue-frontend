require 'byebug'
require_relative "./services/damage/physical.rb"
require "trailblazer/operation"

class App
  def self.call(env)

    req = Rack::Request.new(env)
    data = env['rack.input'].read
    req.post?
    request_data = JSON.parse(data) if data
    result = Damage::Physical.(data: request_data)
    puts result
    case req.path_info
    when /cors/
      [200, {"Content-Type" => "text/html"}, ["Hello World!"], ["#{data}"]]
    when /cors2/
      [500, {"Content-Type" => "text/html"}, ["Goodbye Cruel World!"]]
    else
      [404, {"Content-Type" => "text/html"}, ["I'm Lost!"]]
    end
  end
end
