class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :number
      t.timestamps null: false
    end
  end
end