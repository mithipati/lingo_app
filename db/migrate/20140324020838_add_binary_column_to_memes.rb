class AddBinaryColumnToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :binary, :binary
  end
end
