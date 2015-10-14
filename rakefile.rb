def backup_to_csv(name)
	csvname = "#{name}.csv"
	CSV.open(csvname,'w') do |csv|
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

namespace :db do
	task :backup => [:backupapp, :backupapp2] do
		#Back Up App & App2 AppEvent tables
	end

	task :backupapp do
		require './app'
		backup_to_csv('app_db')
	end
	
	task :backupapp2 do
		require './app2'
		backup_to_csv('app2_db')
	end
end