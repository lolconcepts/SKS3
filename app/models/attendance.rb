class Attendance < ApplicationRecord
	belongs_to :student
  #attr_accessor :classdate, :dow, :student_id
  after_save :setDOW
   def setDOW
	self.dow = Time.now.strftime("%A")
   end
end
