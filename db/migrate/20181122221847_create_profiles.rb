class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :biography
      t.references :cat, foreign_key: true

      t.timestamps
    end
  end
end
