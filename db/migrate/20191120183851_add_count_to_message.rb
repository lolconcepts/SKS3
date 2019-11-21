class AddCountToMessage < ActiveRecord::Migration[5.2]
  def up
    add_column :messages, :count, :string
  end

  def down
    remove_column :messages, :count, :string
  end
end
