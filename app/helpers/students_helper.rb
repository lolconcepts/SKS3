module StudentsHelper
	def daysAtRank(student_id)
		@today = Time.now().to_date
		if Student.find(student_id).last_promotion != nil
			@last_promo = Student.find(student_id).last_promotion.to_date
		else
			@last_promo = @today
		end
		@days = (@today - @last_promo).to_i
		return @days
	end

	def daysInTraining(student_id)
		@attendance = Attendance.where(:student_id => student_id).count
	end
	def studentGained(student_id)
		@month = Time.now().month
		@year = Time.now().year
		@student = Student.find(student_id)
		if @student.created_at && @student.created_at.month == @month && @student.created_at.year == @year
			return true
		else
			return false
		end
	end

	def studentLost(student_id)
		@month = Time.now().month
		@year = Time.now().year
		@student = Student.find(student_id)
		if @student.disabled? && @student.disabled.month == @month && @student.disabled.year == @year
			return true
		else
			return false
		end
	end

	def studentsLost()
		@students = Student.all
		@count = 0
		@students.each do |s|
			if studentLost(s.id)
				@count += 1
			end
		end
		return @count
	end

	def studentsGained()
		@students = Student.all
		@count = 0
		@students.each do |s|
			if studentGained(s.id)
				@count += 1
			end
		end
		return @count
	end

	def smsAddress(id)
		@student = Student.find(id)
		if @student.carrier_id && @student.telephone
			@sms = "#{@student.telephone}#{Carrier.find(@student.carrier_id).suffix}"
		else
			@sms = ""
		end
		return @sms
	end

	def studentGrowth()
		@total_students = Student.all.count
			if @total_students == 0
				return "0.0"
			else
				@diff = (studentsGained - studentsLost)
				return ((@diff.to_f / @total_students.to_f) * 100).round(2)
			end
	end

end
