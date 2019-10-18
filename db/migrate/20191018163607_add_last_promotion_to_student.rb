class AddLastPromotionToStudent < ActiveRecord::Migration[5.2]
  def up
    add_column :students, :last_promotion, :date
  end

  def down
    remove_column :students, :last_promotion
  end
end
