class AddUsernameToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :username, :string
    add_index :cats, :username, unique: true
  end
end
