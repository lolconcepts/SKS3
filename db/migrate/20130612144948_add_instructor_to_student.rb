class AddInstructorToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :instructor, :boolean
  end

  def down
    remove_column :students, :instructor
  end
end
