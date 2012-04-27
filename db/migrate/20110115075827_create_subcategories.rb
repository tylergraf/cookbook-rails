class CreateSubcategories < ActiveRecord::Migration
  def self.up
    create_table :subcategories do |t|
      t.references :category
      t.string 'subcategory'
      t.timestamps
    end
  end

  def self.down
    drop_table :subcategories
  end
end
