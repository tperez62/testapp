require 'data_mapper'
require 'sinatra'
require 'rest-client'
require 'logger'
require './AppEvent'

#Adding a comment to test with git

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/app.db"
DataMapper.auto_upgrade!

set :port, 9494

logger = Logger.new('applog.log')

Thread.new do
	while true do
		sleep(60)
		req = 'http://localhost:4567/hello'
		logger.debug("Sending Request")
		res = RestClient.get(req)
		logger.debug("Printing Response")
		puts res
		AppEvent.create(request_url:req, response_code:res.code)
	end
end

#second comment

get '/hello' do
	logger.debug("Received Request, Sending Response")
	"Hello app2"
end
