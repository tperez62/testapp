require 'data_mapper'
require_relative '../AppEvent.rb'

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/spec/newtest.db"
DataMapper.auto_migrate!

describe "AppEvent" do

	subject { build(:appevent) }
	
	it "should instantiate properly" do
		expect(subject).to be_an_instance_of AppEvent
	end
	
	it "should store attributes properly" do
		expect(subject.request_url).to eql 'defaulturl'
		expect(subject.response_code).to eql 456
	end
	
	it "should save properly" do
		res = subject.save
		expect(res).to be true
	end
	
	it "should load properly" do
		appevent = AppEvent.get(1)
		expect(appevent.request_url).to eql 'defaulturl'
	end
end
