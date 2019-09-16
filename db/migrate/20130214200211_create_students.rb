class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.references :rank
      t.integer :years_in_martial_arts
      t.string :instructors
      t.integer :classes_attended_each_week
      t.boolean :blackbelt_club
      t.boolean :swat
      t.boolean :storm
      t.boolean :demo_team
      t.boolean :tournament_team
      t.string :school
      t.string :favorite_martial_artist
      t.string :favorite_movie
      t.string :favorite_class_activity
      t.string :short_term_goal
      t.string :long_term_goal
      t.integer :tnetid
      t.boolean :tnet_member
      t.string  :pic

      t.timestamps
    end
    #add_index :students, :rank_id
  end
end
