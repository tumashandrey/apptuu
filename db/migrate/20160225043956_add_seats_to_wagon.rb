class AddSeatsToWagon < ActiveRecord::Migration
  def change
    change_table :wagons do |t|
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :seating
      t.string :type
      t.integer :number
    end
  end
end
