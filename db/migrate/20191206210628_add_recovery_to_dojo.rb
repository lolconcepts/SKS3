class AddRecoveryToDojo < ActiveRecord::Migration[5.2]
  def up
    add_column :dojos, :recovery, :boolean, :default => 0
  end

  def down
    remove_column :dojos, :recovery
  end
end
