class AddCarrierToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :carrier, foreign_key: true
  end
end
