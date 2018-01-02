class RemoveEmailNameAddUsername < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :username, :string
  end
end
