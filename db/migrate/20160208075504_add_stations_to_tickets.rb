class AddStationsToTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.integer :railway_station_start_id
      t.integer :railway_station_end_id
    end

    add_belongs_to :tickets, :start_station
    add_belongs_to :tickets, :end_station
  end

end