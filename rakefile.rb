namespace :db do
	task :backup => [:backupapp, :backupapp2] do
		#Back Up App & App2 AppEvent tables
	end

	task :backupapp do
		require './app'
		CSV.open('app_db.csv','w') do |csv|
			headers = ['Created At','Request Url','Response Code']
			csv << headers
			AppEvent.all.each do |event|
				a = []
				a << event.created_at
				a << event.request_url
				a << event.response_code
				csv << a
			end
		end
	end
	
	task :backupapp2 do
		require './app2'
		CSV.open('app2_db.csv','w') do |csv|
			headers = ['Created At','Request Url','Response Code']
			csv << headers
			AppEvent.all.each do |event|
				a = []
				a << event.created_at
				a << event.request_url
				a << event.response_code
				csv << a
			end
		end
	end
end