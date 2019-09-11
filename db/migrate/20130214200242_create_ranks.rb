class CreateRanks < ActiveRecord::Migration[5.2]
  def up
    create_table :ranks do |t|
      t.string :color
      t.timestamps
    end
    Rank.create(:color => 'White Belt')
    Rank.create(:color => 'Adv.White Belt')
    Rank.create(:color => 'Yellow Belt')
    Rank.create(:color => 'Adv.Yellow Belt')
    Rank.create(:color => 'Orange Belt')
    Rank.create(:color => 'Adv.Orange Belt')
    Rank.create(:color => 'Purple Belt')
    Rank.create(:color => 'Blue Belt')
    Rank.create(:color => 'Green Belt')
    Rank.create(:color => 'Brown Belt')
    Rank.create(:color => '3rd Degree Brown Belt')
    Rank.create(:color => '2nd Degree Brown Belt')
    Rank.create(:color => '1st Degree Brown Belt')
    Rank.create(:color => 'Junior Black Belt')
    Rank.create(:color => '1st Degree Black Belt')
    Rank.create(:color => '2nd Degree Black Belt')
    Rank.create(:color => '3rd Degree Black Belt')
    Rank.create(:color => '4th Degree Black Belt')
    Rank.create(:color => '5th Degree Black Belt')
    Rank.create(:color => '6th Degree Black Belt')
    Rank.create(:color => '7th Degree Black Belt')
    Rank.create(:color => '8th Degree Black Belt')
    Rank.create(:color => '9th Degree Black Belt')
    Rank.create(:color => '10th Degree Black Belt')
  end

  def down
  drop_table :ranks
  end

end
