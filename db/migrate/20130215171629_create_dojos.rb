class CreateDojos < ActiveRecord::Migration[5.2]
  def up
    create_table :dojos do |t|
      t.string :name
      t.string :motto
      t.string :telephone
      t.string :website
      t.string :email
      t.string :pic
      
      t.timestamps
    end
      Dojo.create(:name => 'Initial Configuration',
		  :motto => '...',
		  :telephone => '(401)461-6500',
		  :website => 'http://www.t0urnament.net',
		  :email => 'blackbelt@t0urnament.net')
  end

  def down
    drop_table :dojos
  end
end
