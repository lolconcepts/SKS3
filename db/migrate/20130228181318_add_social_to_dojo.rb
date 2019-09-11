class AddSocialToDojo < ActiveRecord::Migration[5.2]
	def up
		change_table :dojos do |t|
			t.string :twitter
			t.string :facebook
			t.string :youtube
		end
	end

	def down
		remove_column :dojos, :twitter
		remove_column :dojos, :facebook
		remove_column :dojos, :youtube
	end
end
