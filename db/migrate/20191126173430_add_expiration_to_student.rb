class AddExpirationToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :expiration, :date
  end

  def down
    remove_column :students, :expiration
  end
end
