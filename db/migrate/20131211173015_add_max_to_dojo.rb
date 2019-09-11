class AddMaxToDojo < ActiveRecord::Migration[5.2]
  def up
    add_column :dojos, :max, :integer, :default => 100
  end

  def down
  	remove_column :dojos, :max
  end
end
