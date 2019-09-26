class DashboardController < ApplicationController

def index
end

def payments
	# Get Student Record
	@student = Student.find(params[:student_id]) || "0"
	
end

end
