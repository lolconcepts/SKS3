class CreateMessages < ActiveRecord::Migration[5.2]
  def up
    create_table :messages do |t|
      t.string :body, limit: 160

      t.timestamps
    end
  end

  def down
  	drop_table :messages
  end
end
