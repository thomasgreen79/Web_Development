class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :num
      t.text :layout
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
