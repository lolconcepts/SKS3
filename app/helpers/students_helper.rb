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

end
