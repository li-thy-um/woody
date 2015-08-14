class AddUserIdToMission < ActiveRecord::Migration
  def change
    add_column :missions, :user_id, :integer
  end
end
