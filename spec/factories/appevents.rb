require_relative '../../AppEvent'

FactoryGirl.define do
	factory :appevent, class: AppEvent do
		request_url 'defaulturl'
		response_code 456
	end
end
