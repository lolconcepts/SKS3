class AddPhotoToDojos < ActiveRecord::Migration[5.2]
  def up
    add_column :dojos, :pic, :string
  end

  def down
  	remove_column :dojos, :pic
  end
end
