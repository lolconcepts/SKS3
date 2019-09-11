class CreateClassSlips < ActiveRecord::Migration[5.2]
  def up
    create_table :class_slips do |t|
      t.string :dayofweek
      t.time :timeofday
      t.string :agegroup
      t.string :rankgroup

      t.timestamps
    end
 	      @daysofweek = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
        @agegroups = ['Tiny Tots','Kids','Adults']
	      @rankgroups = ['Beginner','Intermediate','Advanced','All-Ranks'] 
 end

 def down
  drop_table :class_slips
 end

end
