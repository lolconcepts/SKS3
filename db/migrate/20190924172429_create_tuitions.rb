class CreateTuitions < ActiveRecord::Migration[5.2]
  def up
    create_table :tuitions do |t|
      t.string :stripe_id
      t.string :student_id
      t.string :amount
      t.timestamps
    end
  end

   def down
    drop_table :tuitions
    end
end
