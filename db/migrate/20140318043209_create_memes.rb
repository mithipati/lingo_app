class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :image
      t.string :top
      t.string :bottom
      t.references :word, index: true

      t.timestamps
    end
    add_index :memes, :image
  end
end
