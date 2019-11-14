class AddSmSokToStudents < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :sms_ok, :boolean, default: false
  end

  def down
    remove_column :students, :sms_ok
  end
end
