class AddCardiokickToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :cardiokick, :boolean
  end

  def down
    remove_column :students, :cardiokick
  end
end
