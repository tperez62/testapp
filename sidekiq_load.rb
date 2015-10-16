#This file is used to point sidekiq to the workers directory
#Sidekiq -r ./sidekiq_load.rb

require 'require_all'
require_all './workers'
