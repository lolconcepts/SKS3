class AddDisabledToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :disabled, :date
  end
  def down
    remove_column :students, :disabled
  end
end
