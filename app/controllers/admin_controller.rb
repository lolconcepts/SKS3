class AdminController < ApplicationController
before_action :authenticate_user!
def index
	@student_count = Student.count
    @students = Student.all
	@dojo = Dojo.first
	@Version = "19.10" # YEAR.MONTH of update
	# Get Attendance Info For Graph
	@attendances = Attendance.all
    
    @mon = 0
    @tue = 0
    @wed = 0
    @thu = 0
    @fri = 0
    @sat = 0
    @sun = 0
    
    if @attendances.count != 0
    @attendances.each do |attend|
    	dow = attend.created_at.strftime("%A")
    	case dow
    	when "Monday"
    		@mon += 1
    	when "Tuesday"
    		@tue += 1
    	when "Wednesday"
    		@wed += 1
    	when "Thursday"
    		@thu += 1
    	when "Friday"
    		@fri += 1
    	when "Saturday"
    		@sat += 1
    	else
    		@sun += 1
    	end
    end
	end

end
end
