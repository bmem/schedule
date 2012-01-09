class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :display_name
      t.string :full_name
      t.string :email
      t.string :shirt_size
      t.date :birthday
      t.boolean :likes_bacon

      t.timestamps
    end
  end
end
