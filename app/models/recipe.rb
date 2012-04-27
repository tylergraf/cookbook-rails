class Recipe < ActiveRecord::Base
    belongs_to :subcategory

    has_attached_file :recipe_image

end
