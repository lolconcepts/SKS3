class CreatePrograms < ActiveRecord::Migration[5.2]
  def up
    create_table :programs do |t|
      t.string :description

      t.timestamps
    end
    Program.create(:description => "Karate")
    Program.create(:description => "Kickboxing")
    Program.create(:description => "Krav Maga")
    Program.create(:description => "Sword")
    Program.create(:description => "Tae Kwon Do")
    Program.create(:description => "Ju-Jitsu")
    Program.create(:description => "6-Week Special")
    Program.create(:description => "Promo")
  end

  def down
    drop_table :programs
  end

end
