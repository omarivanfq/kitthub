class UpdateTaggingsForeignKeys < ActiveRecord::Migration[5.2]
  def change

    add_foreign_key :taggings, :posts, on_delete: :cascade
  end
end
