class CreateAttendances < ActiveRecord::Migration[5.2]
  def up
    create_table :attendances do |t|
      t.references :student
      t.string :dow
      t.date :classdate

      t.timestamps
    end
    #add_index :attendances, :student_id
  end

  def down
  	drop_table :attendances
  end
end
