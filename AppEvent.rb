class AppEvent
	include DataMapper::Resource
	
	property :id			, Serial
	property :created_at	, DateTime
	property :request_url	, String
	property :response_code	, Integer
end

#another comment
#another another comment

