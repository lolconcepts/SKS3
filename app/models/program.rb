class Program < ApplicationRecord
	def student_count
		@students = Student.all.where(:program_id => self.id)
		return @students.count
	end
end
