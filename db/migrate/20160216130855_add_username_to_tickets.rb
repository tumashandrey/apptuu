class AddUsernameToTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.string :user_name
    end
  end
end
