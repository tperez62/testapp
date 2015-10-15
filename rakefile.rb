namespace :db do
	desc 'Backup all databases to a CSV'
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

def backup_to_csv(name)
	csvname = "#{name}.csv"
	CSV.open(csvname, 'w') do |csv|
		# Column headers
		csv << [
			'Created At', 
			'Request Url', 
			'Response Code'
		]

		AppEvent.each do |event|
			csv << [
				event.created_at,
				event.request_url,
				event.response_code
			]
		end
	end
end
