class AddBirthdayMessageToDojo < ActiveRecord::Migration[5.2]
  def up
    add_column :dojos, :birthday_message, :text
  end

  def down
  	remove_column :dojos, :birthday_message
  end
end
