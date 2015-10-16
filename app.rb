require 'data_mapper'
require 'sinatra'
require 'rest-client'
require 'logger'
require './AppEvent'
require 'sidekiq'
require 'require_all'
require_all './workers'

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

get '/hello' do
	logger.debug("Received Request, Sending Response")
	"Hello app2"
end

get '/export_tables' do
	logger.debug("Exporting tables to CSV files")
	BackupWorker.perform_async
end
