require 'data_mapper'
require_relative '../AppEvent.rb'

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/spec/newtest.db"
DataMapper.auto_migrate!

describe "AppEvent" do
	it "should instantiate properly" do
		appevent = AppEvent.new
		expect(appevent).to be_an_instance_of AppEvent
	end
	
	it "should store attributes properly" do
		appevent = build(:appevent)
		expect(appevent.request_url).to eql 'defaulturl'
		expect(appevent.response_code).to eql 456
	end
	
	it "should save properly" do
		appevent = build(:appevent)
		res = appevent.save
		expect(res).to be true
	end
	
	it "should load properly" do
		appevent = AppEvent.get(1)
		expect(appevent.request_url).to eql 'defaulturl'
	end
end
