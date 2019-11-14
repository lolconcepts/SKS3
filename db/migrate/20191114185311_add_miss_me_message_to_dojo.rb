class AddMissMeMessageToDojo < ActiveRecord::Migration[5.2]
  def up
    add_column :dojos, :missme_message, :text
  end

  def down
  	remove_column :dojos, :missme_message
  end
end
