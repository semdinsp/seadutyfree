require 'rubygems'
require 'bundler/setup'
require 'rack/ssl'

Bundler.require(:default)
use Rack::Deflater

use Rack::ConditionalGet
use Rack::ETag

puts "Envionment is: #{ENV['RACK_ENV']}"
if ENV['RACK_ENV']=='production'
  use Rack::SSL 
  puts "force ssl with rack-ssl"
end 

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'
run Nesta::App
