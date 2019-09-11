class AddMastersclubToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :mastersclub, :boolean
  end

  def down
    remove_column :students, :mastersclub
  end
end
