class ApplicationController < ActionController::Base
	@Version = 19.12 # YEAR.MONTH of update
	@DojoName = ENV['DOJO_NAME'] || "."
end
