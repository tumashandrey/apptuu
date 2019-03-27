class AddSortByFieldInTrain < ActiveRecord::Migration
  def change
    change_table :trains do |t|
      t.string  :sort_by
    end
  end
end
