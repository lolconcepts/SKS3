class CreateRanks < ActiveRecord::Migration[5.2]
  def up
    create_table :ranks do |t|
      t.string :color
      t.string :base
      t.timestamps
    end
    Rank.create(:color => 'White Belt',:base => 'white')
    Rank.create(:color => 'Adv.White Belt',:base => 'white')
    Rank.create(:color => 'Yellow Belt',:base => 'yellow')
    Rank.create(:color => 'Adv.Yellow Belt',:base => 'yellow')
    Rank.create(:color => 'Orange Belt',:base => 'orange')
    Rank.create(:color => 'Adv.Orange Belt',:base => 'orange')
    Rank.create(:color => 'Purple Belt',:base => 'purple')
    Rank.create(:color => 'Blue Belt',:base => 'blue')
    Rank.create(:color => 'Green Belt',:base => 'green')
    Rank.create(:color => 'Brown Belt',:base => 'brown')
    Rank.create(:color => '3rd Degree Brown Belt',:base => 'brown')
    Rank.create(:color => '2nd Degree Brown Belt',:base => 'brown')
    Rank.create(:color => '1st Degree Brown Belt',:base => 'brown')
    Rank.create(:color => 'Junior Black Belt',:base => 'black')
    Rank.create(:color => '1st Degree Black Belt',:base => 'black')
    Rank.create(:color => '2nd Degree Black Belt',:base => 'black')
    Rank.create(:color => '3rd Degree Black Belt',:base => 'black')
    Rank.create(:color => '4th Degree Black Belt',:base => 'black')
    Rank.create(:color => '5th Degree Black Belt',:base => 'black')
    Rank.create(:color => '6th Degree Black Belt',:base => 'black')
    Rank.create(:color => '7th Degree Black Belt',:base => 'black')
    Rank.create(:color => '8th Degree Black Belt',:base => 'black')
    Rank.create(:color => '9th Degree Black Belt',:base => 'black')
    Rank.create(:color => '10th Degree Black Belt',:base => 'black')
  end

  def down
  drop_table :ranks
  end

end
