# class App
#   def call(env)
#     req = Rack::Request.new(env)
#     case req.path_info
#     when /hello/
#       [200, {"Content-Type" => "text/html"}, ["Hello World!"]]
#     when /goodbye/
#       [500, {"Content-Type" => "text/html"}, ["Goodbye Cruel World!"]]
#     else
#       [404, {"Content-Type" => "text/html"}, ["I'm Lost!"]]
#     end
#   end
# end
#
require 'byebug'
class App
  require_relative "./services/damage/physical.rb"
  require "trailblazer/operation"

  def call(env)
    res = Damage::Physical.(amount: 232)
    debugger
    puts "#{res}"
    [200, {}, ["#{res[:total]}"]]
  end
end