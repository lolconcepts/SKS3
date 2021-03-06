class AdminController < ApplicationController
before_action :authenticate_user!
def index
    @birthday_count = BirthdayCount()
    @missed_count = missedCount()
	@student_count = Student.count
    @expiring_contracts = []
    @karate_program_count = Program.find(1).student_count
    @kickboxing_program_count = Program.find(2).student_count
    @krav_maga_program_count = Program.find(3).student_count
    @sword_program_count = Program.find(4).student_count
    @tae_program_count = Program.find(5).student_count
    @trial_program_count = Program.find(6).student_count

    @students = Student.all
    @students.each do |s|
        if s.expiring
            @expiring_contracts << s
        end
    end
	@dojo = Dojo.first
	@Version = "20.01" # YEAR.MONTH of update
	# Get Attendance Info For Graph
	@attendances = Attendance.all
    @alert_count = 0
    @students.each do |s|
        if s.missingInfo.empty?
        else
            @alert_count += 1
        end
    end
    
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
def alerts
    @students = Student.all.where(:disabled => nil)
    @alerted_students = []
    @students.each do |s|
        if s.missingInfo.empty?
        else
            @alerted_students << s
        end
    end
    @alerted_students
end

def selfserve
    @students = Student.all.where(:disabled => nil)
end

private

def BirthdayCount()
    @students = Student.all
    @birthday_count = 0
    @students.each do |s|
        if s.dob.month == Time.now.month
            @birthday_count += 1
        end
    end
    return @birthday_count
end

def missedCount()
    @students = Student.all
    @missed_count = 0
    @students.each do |s|
        if s.is_missed
            @missed_count += 1
        end
    end
    return @missed_count
end




end
