class AddCountToDojo < ActiveRecord::Migration[5.2]
  def up
    add_column :dojos, :count, :integer, :default => 0
  end

  def down
  	remove_column :dojos, :count
  end
end
