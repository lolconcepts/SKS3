class Dojo < ApplicationRecord

attr_accessor :code,:pic #:email, :motto, :name, :telephone, :website, :facebook, :twitter, :youtube,:photo,:photo_content_type, :photo_file_name, :photo_file_size

  #PaperClip
  # has_attached_file :photo,
  #   				:styles => {
  #     				:thumb => "100x100#",
  #     				:sidekickmobile => "300x450#",
  #     				:sidekick => "400x450#"}
  #do_not_validate_attachment_file_type :photo
  mount_uploader :pic, PhotoUploader

   def available_prints
   	       if (self.max > self.count)
			return true
	       else
			return false
	       end
   end

   def indicator
	val = ((self.count.to_f/self.max.to_f) * 100).round

	case val
	when 0..49
		return "go"
	when 50..74
		return "warn"
	else
		return "critical"
	end
   end
   def meterval
	val= ((self.count.to_f/self.max.to_f) * 100.0)
        return val
   end
end

