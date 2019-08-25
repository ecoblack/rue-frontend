require 'rack/cors'

require 'json'
require 'byebug'
require "./app"

app = Rack::Builder.app do
  use Rack::Cors do
    allow do
      origins '*'
      resource '*', :headers => :any, :methods => [:get, :post, :options]
    end
  end
  use Rack::CommonLogger
  run App
  # run App
end

run app