class ApplicationController < ActionController::Base
	@Version = 19.10 # YEAR.MONTH of update
	@DojoName = ENV['DOJO_NAME'] || "."
end
