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
                  @sidekick = ip_addr.ip_address 
                end
	      end
	      return @sidekick
        end
end