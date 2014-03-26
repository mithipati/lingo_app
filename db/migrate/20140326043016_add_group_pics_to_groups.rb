class AddGroupPicsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :group_pic, :string
  end
end
