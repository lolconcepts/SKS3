class AddTuitionToStudent < ActiveRecord::Migration[5.2]
  def up
  	add_column :students, :tuition, :string , :default => "95"
  end

  def down
  	remove_column :students, :tuition
  end
end
