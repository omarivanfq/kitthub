class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.date :dob
      t.references :breed, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
