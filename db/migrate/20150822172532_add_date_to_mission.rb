class AddDateToMission < ActiveRecord::Migration
  def change
    add_column :missions, :date, :string
  end
end
