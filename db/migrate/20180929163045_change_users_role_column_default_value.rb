class ChangeUsersRoleColumnDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :role, "member"
  end
end
