class AdminController < ApplicationController
before_action :authenticate_user!
def index
	@student_count = Student.count
	@dojo = Dojo.first
	@Version = "19.10" # YEAR.MONTH of update
end
end
