class ConvertSchedulePeopleToView < ActiveRecord::Migration
  def up
    cols = "id, display_name AS name, created_at, updated_at"
    drop_table :schedule_people
    create_view :schedule_people, "SELECT #{cols} FROM people" do |t|
      t.column :id
      t.column :name
      t.column :created_at
      t.column :updated_at
    end
  end

  def down
    drop_view :schedule_people
    create_table :schedule_people do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
