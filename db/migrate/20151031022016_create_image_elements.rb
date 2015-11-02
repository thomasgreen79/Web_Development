class CreateImageElements < ActiveRecord::Migration
  def change
    create_table :image_elements do |t|
      t.integer :num
      t.text :path
      t.references :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
