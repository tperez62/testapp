require 'data_mapper'
require 'sinatra'
require 'rest-client'
require 'logger'
require './AppEvent'

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/app2.db"
DataMapper.auto_upgrade!

logger = Logger.new('app2log.log')

Thread.new do
	while true do
		sleep(60)
		req = 'http://localhost:9494/hello'
		logger.debug("Sending Request")
		res = RestClient.get(req)
		logger.debug("Printing Response")
		puts res
		AppEvent.create(request_url:req, response_code:res.code)
	end
end

get '/hello' do
	logger.debug("Received Request, Sending Response")
	"Hello app"
end
