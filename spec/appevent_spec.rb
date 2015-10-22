require 'spec_helper'

describe "AppEvent" do
	it "should instantiate properly" do
		appevent = AppEvent.new
		expect(appevent).to be_an_instance_of AppEvent
	end
	
	it "should store attributes properly" do
		appevent = AppEvent.new
		appevent.response_code = 200
		expect(appevent.response_code).to eql 200
	end
	
	it "should save properly" do
		appevent = AppEvent.new
		appevent.request_url = 'url'
		appevent.response_code = 200
		result = appevent.save
		expect(result).to be true
	end
	
	it "should load properly" do
		appevent = AppEvent.get(1)
		expect(appevent.request_url).to eql 'url'
	end
end
