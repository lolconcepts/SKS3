class AddDobToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :dob, :date
  end

  def down
    remove_column :students, :dob
  end
end
