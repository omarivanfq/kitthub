class UpdateSharesForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :shares, :profiles
    remove_foreign_key :shares, :posts

    add_foreign_key :shares, :profiles, on_delete: :cascade
    add_foreign_key :shares, :posts, on_delete: :cascade
  end
end
