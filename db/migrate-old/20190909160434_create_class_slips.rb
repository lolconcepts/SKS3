class CreateClassSlips < ActiveRecord::Migration[5.2]
  def change
    create_table :class_slips do |t|

      t.timestamps
    end
  end
end
