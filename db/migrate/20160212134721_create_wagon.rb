class CreateWagon < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :top_seats
      t.integer :lower_seats
      t.string :wagon_type
      t.timestamps null: false
    end

    add_belongs_to :wagons, :train

  end
end
