class RemoveStationIdFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :start_station_id
    remove_column :tickets, :end_station_id
  end
end
