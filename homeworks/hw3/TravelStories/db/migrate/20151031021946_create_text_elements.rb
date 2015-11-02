class CreateTextElements < ActiveRecord::Migration
  def change
    create_table :text_elements do |t|
      t.integer :num
      t.text :content
      t.references :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
