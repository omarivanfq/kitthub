class UpdateCommentsForeignKeys < ActiveRecord::Migration[5.2]
  def change  
    remove_reference :comments, :user
    remove_reference :comments, :post
    add_reference :comments, :user, on_delete: :cascade
    add_reference :comments, :post, on_delete: :cascade
  end
end
