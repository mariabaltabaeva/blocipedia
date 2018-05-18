class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
<<<<<<< HEAD
    add_column :users, :role, :integer
    #default: 0
=======
    add_column :users, :role, :integer, default: 0
>>>>>>> user-story-4-roles
  end
end
