class CreateDojos < ActiveRecord::Migration[5.2]
  def change
    create_table :dojos do |t|

      t.timestamps
    end
  end
end
