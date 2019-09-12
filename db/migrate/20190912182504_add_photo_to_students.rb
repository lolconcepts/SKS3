class AddPhotoToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :pic, :string
  end
end
