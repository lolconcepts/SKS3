class AddPhotoToStudents < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :pic, :string
  end

  def down
  	remove_column :students, :pic
  end
end
