require 'spec_helper'
require 'rack/test'
require_relative '../app.rb'

def app
	Sinatra::Application
end

describe "App" do
	include Rack::Test::Methods
	
	it "should respond to hello route" do
		get '/hello'
		expect(last_response).to be_ok
	end
end
