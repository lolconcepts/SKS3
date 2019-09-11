class AddContactToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :address, :string
    add_column :students, :city, :string
    add_column :students, :state, :string
    add_column :students, :zip, :string
    add_column :students, :email, :string
    add_column :students, :telephone, :string
  end

  def down
  	remove_column :students, :address
    remove_column :students, :city
    remove_column :students, :state
    remove_column :students, :zip
    remove_column :students, :email
    remove_column :students, :telephone
  end
end
