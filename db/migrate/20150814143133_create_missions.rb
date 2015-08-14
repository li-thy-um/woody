class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
