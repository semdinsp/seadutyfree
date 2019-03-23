require "bundler/setup"
require 'test/unit'
require 'rubygems'
#gem 'rack-test'
require 'rack/test'
require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'

ENV['RACK_ENV'] = 'test'

class TLLottoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Nesta::App
  end

  def test_first_pageworks
    puts "testing first page"
    get '/'
    #puts last_response.methods
    assert last_response.ok?,  "last resonse not ok"
    assert last_response.body.include?('electronic distribution'), 'des not inclued powered by'
  end

  def test_key_pages
     
     pagelist=["/","about"]
     puts "testing top level pages #{pagelist.inspect}"
     pagelist.each { |page| 
          get page
          assert last_response.ok?, "#{page} not found"
          #assert_equal last_response.body.includes? 'Ficonab Pte. Ltd.'
            }
   end
  
  
end
