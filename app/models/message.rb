class Message < ApplicationRecord
	profanity_filter :body, :method => 'stars'
end
