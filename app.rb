# require 'rack/cors'
# require 'byebug'
#
# class App
#   require_relative "./services/damage/physical.rb"
#   require "trailblazer/operation"
# #
#   # def call(env)
#   #   req = Rack::Request.new(env)
#   #   if req.post?
#   #     puts env['rack.input'].read
#   #   end
#   #   res = Damage::Physical.(amount: 232)
#   #
#   #   puts "#{res}"
#   #   [200, {}, ["#{res[:total]}"]]
#   # end
#
# end