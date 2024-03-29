class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.references :subcategory
      t.string "title"
      t.string "subtitle"
      t.text "ingredients"
      t.text "directions"

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
