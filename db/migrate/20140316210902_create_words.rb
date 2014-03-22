class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :definition
      t.references :group, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
