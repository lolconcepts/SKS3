class AddAttachmentPhotoToDojos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :dojos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :dojos, :photo
  end
end
