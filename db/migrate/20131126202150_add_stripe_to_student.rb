class AddStripeToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :stripe, :integer
  end

  def down
  	remove_column :students, :stripe
  end
end
