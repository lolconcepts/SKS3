class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  after_update :send_notification_of_new_rank

  belongs_to :rank
  has_many :tuitions
  belongs_to :program
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
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

  def remove_pic
	self.photo_file_name = nil
  end

  def expiring(num_months=2)
    #Default is 2 months warning
    @today = Time.now()
    @warning = (num_months) * 30
    if self.expiration != nil
      @diff_days = self.expiration - @today.to_date
      if @diff_days.to_i < @warning.to_i
        return true
      else
        return false
      end
    else
      return false
    end
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
    self.last_promotion = Time.now()
    end

  end 

  def is_missed

    #consider the student missed if last checkin in greater than 2 weeks and student has at least a months worth of attendance
    if self.classes_attended_each_week != nil
      @max_classes = self.classes_attended_each_week * 4 # This is the baseline
    else
      @max_classes = 4
    end
    @attendance_records = Attendance.where(:student_id => self.id) # Get attendance Records

    if @attendance_records.count > @max_classes
      if @attendance_records.last.created_at < 2.weeks.ago
        return true
      else
        return false
      end
    end
 #   @classes_last_month = 0
 #   if (self.classes_attended_each_week != nil)
 #   	@max_classes = self.classes_attended_each_week * 4
 #   end
 #   @attendance_records = Attendance.where(:student_id => self.id)
 #   @attendance_records.each do |record|
	# if(record.created_at > 1.month.ago)
	# 	@classes_last_month += 1
	# end
 #   end
 #   @average = @classes_last_month/@max_classes.to_f * 100
 #   if(@attendance_records.count > 8 && @average < 50.0)
	# return true
 #   else
	# return false
 #   end
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
  
  def missingInfo
    @missing_info = []
    #Address
    if self.address == nil
      @missing_info << "address"
    end
    #Telephone
    if self.telephone == ""
      @missing_info << "telephone"
    end
    #Birthdate
    if self.dob == "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
      @missing_info << "birthday"
    end
    if self.email == ""
      @missing_info << "email"
    end
    return @missing_info

  end

  def smsAddress
    if self.carrier_id && self.telephone
      @sms = "#{self.telephone}#{Carrier.find(self.carrier_id).suffix}"
    else
      @sms = ""
    end
    return @sms
  end


  def getAge
    if dob != nil
    	return (Time.now.year - self.dob.to_date.year)
    else
	return "Undefined (Please Edit)"
    end
  end

  def getStripeCharge(recover_cost=false,percentage=0.029,additional=0.30)
    if recover_cost
      @fee = ((self.tuition.to_f * percentage.to_f + additional.to_f) + self.tuition.to_f).round(2)
      @fee = @fee.to_s.sub(/[.]/,"")
      return @fee
    else
      return self.tuition + "00"
    end
  end

end

