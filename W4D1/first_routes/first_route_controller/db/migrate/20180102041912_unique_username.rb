class UniqueUsername < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, null: false, unique: true
  end
end
