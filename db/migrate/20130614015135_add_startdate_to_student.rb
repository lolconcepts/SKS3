class AddStartdateToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :startdate, :date
  end

  def down
    remove_column :students, :startdate
  end
end
