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

	# def getQR(rurl,page,id,value)
	# 	@page = page || ""
	# 	@id = id || ""
	# 	@value = value || ""
	# 	@rurl = rurl || root_url
	# 	@url = '<"img src=" + "https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=#{rurl}#{page}?#{id}=#{value}&choe=UTF-8">'
	# end

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