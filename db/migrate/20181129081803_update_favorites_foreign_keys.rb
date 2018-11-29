class UpdateFavoritesForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_reference :favorites, :user
    remove_reference :favorites, :post
    add_reference :favorites, :user, on_delete: :cascade
    add_reference :favorites, :post, on_delete: :cascade
  end
end
