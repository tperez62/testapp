require 'rack/test'
require_relative '../app2.rb'

def app
	Sinatra::Application
end

describe "App2" do
	include Rack::Test::Methods
	
	it "should respond to hello route" do
		get '/hello'
		expect(last_response).to be_ok
	end
end
