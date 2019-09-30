class DashboardController < ApplicationController

def index
end

def payments
	# Get Student Record
	@student = Student.find(params[:student_id]) || Student.first
	
end

end
