module ApplicationHelper
	def getQty(code)
		@raw = code.hex
		@qty = @raw - Time.now.year
			if @qty.to_i > 0
				return @qty
			else
				return 0
			end
	end

	def monthlyIncomeForecast
		#See expected Monthly Revenue Based on Active Students
		@income = 0
		@students = Student.all.where(:disabled => nil)

		@students.each do |s|
			@income += s.tuition.to_i
		end

		return @income
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

	def studentGrowth()
		@total_students = Student.all.count
		@diff = (studentsGained.to_f - studentsLost.to_f)
		return "#{((@diff / @total_students.to_f) * 100).to_s}%"
	end

	def belt_count(base)
		@students = Student.all
		@count = 0
		@students.each do |s|
			if s.rank.base == base
				@count += 1
			end
		end
		return @count
	end
	def generateCode(qty)
		@qty = Time.now.year.to_i + qty.to_i
		@encoded = @qty.to_s(16)
		return @encoded
	end

	def gasTank(dojo_id)
		@dojo = Dojo.find(dojo_id)
		return (@dojo.max - @dojo.count)
	end
      def fullname(id)
	  @s = Student.find(id)
	  return "#{@s.first_name} #{@s.last_name}"
      end
        def getSK()
    	      Socket.ip_address_list.each do |ip_addr|
                if ip_addr.ip_address != "127.0.0.1"
                  @sidekick = ip_addr
                end
	      end
	      return @sidekick
        end
end