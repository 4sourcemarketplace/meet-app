class AddGroupToRoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :group, foreign_key: true
  end
end
