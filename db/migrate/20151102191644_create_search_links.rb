class CreateSearchLinks < ActiveRecord::Migration
  def change
    create_table :search_links do |t|
      t.string :lastName
      t.string :firstName
      t.string :location
      t.string :travelStyle
      t.string :storyType

      t.timestamps null: false
    end
  end
end
