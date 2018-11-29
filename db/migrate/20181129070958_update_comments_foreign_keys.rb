class UpdateCommentsForeignKeys < ActiveRecord::Migration[5.2]
  def change  
    remove_reference :comments, :user
    add_reference :comments, :user, on_delete: :cascade
  end
end
