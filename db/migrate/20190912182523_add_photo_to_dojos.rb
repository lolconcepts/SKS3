class AddPhotoToDojos < ActiveRecord::Migration[5.2]
  def change
    add_column :dojos, :pic, :string
  end
end
