class BackupWorker
	include Sidekiq::Worker
	
	def perform
		system 'rake db:backup'
	end
end
