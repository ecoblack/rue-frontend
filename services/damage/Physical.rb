require "trailblazer/operation"
require 'byebug'
require 'pry'

module Damage
  class Physical < Trailblazer::Operation

    step :deal

    def deal(options, *)
      binding.pry
      options[:total] = options[:amount] * 2
      puts "Hello, TrailbXlazer!"
      true
    end
  end
end


