class UpdateProfilesForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_reference :profiles, :cat, foreign_key: true
    add_reference :profiles, :cat, on_delete: :cascade
  end
end
