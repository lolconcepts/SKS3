class AddBaseToRank < ActiveRecord::Migration[5.2]
  def up	
    add_column :ranks, :base, :string
  end

  def down 
  	remove_column :ranks, :base
  end
end
