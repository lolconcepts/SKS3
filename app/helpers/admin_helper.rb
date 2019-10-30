module AdminHelper
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

	def studentGrowth()
		@total_students = Student.all.count
		@diff = (studentsGained - studentsLost)
		return ((@diff.to_f(2) / @total_students.to_f(2)) * 100)
	end
end
