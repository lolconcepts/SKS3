class Student < ApplicationRecord
after_update :send_notification_of_new_rank

  belongs_to :rank
  attr_accessor :pic#:address,:city,:state,:zip,:email,:telephone,:photo,:age,:dob,:startdate, :blackbelt_club, :instructor, :mastersclub, :classes_attended_each_week, :demo_team, :favorite_class_activity, :favorite_martial_artist, :favorite_movie, :first_name, :instructors, :last_name, :long_term_goal, :photo_content_type, :photo_file_name, :photo_file_size, :school, :short_term_goal, :storm, :swat, :tnet_member, :tnetid, :tournament_team, :years_in_martial_arts,:rank_id, :cardiokick
  #v3.0 Profanity Filter => replaces with stars
  profanity_filter :favorite_class_activity, :favorite_martial_artist, :favorite_movie, :first_name, :instructors, :last_name, :long_term_goal, :school, :short_term_goal, :method => 'stars'
  
  #PaperClip
  # has_attached_file :photo,
  #   :styles => {
  #     :thumb => "100x100#",
  #     :sidekickmobile => "300x450#",
  #     :sidekick => "400x450#"}

  mount_uploader :pic, PhotoUploader
      
  def remove_pic
	self.photo_file_name = nil
  end

  def years_in_training
    if self.startdate != nil
	return (Time.now.year - self.startdate.to_date.year)
    else
	return "Undefined (Please Edit)"
    end
  end
  def send_notification_of_new_rank
  	if (self.rank_id_changed? && self.created_at != self.updated_at)
		StudentMailer.new_rank(self).deliver
        end

  end 

  def is_missed
   @classes_last_month = 0
   if (self.classes_attended_each_week != nil)
   	@max_classes = self.classes_attended_each_week * 4
   end
   @attendance_records = Attendance.where(:student_id => self.id)
   @attendance_records.each do |record|
	if(record.created_at > 1.month.ago)
		@classes_last_month += 1
	end
   end
   @average = @classes_last_month/@max_classes.to_f * 100
   if(@attendance_records.count > 8 && @average < 50.0)
	return true
   else
	return false
   end

  end
  def fullname
  	@fn = "#{self.first_name} #{self.last_name}"
	  return @fn
  end
  
  def is_birthday
    if self.dob.month == Time.now.month && self.dob.day == Time.now.day
      return true
    else 
      return false
    end
  end
    
  def getAge
    if dob != nil
    	return (Time.now.year - self.dob.to_date.year)
    else
	return "Undefined (Please Edit)"
    end
  end

end

