class PublicController < ApplicationController
  layout 'public'
  
  def index
    @categories = Category.order('category ASC').all
  end
  def app
    @categories = Category.order('category ASC').all
  end

  def list
    @recipes = Recipe.find_all_by_subcategory_id(params[:id])
    @subcategory = Subcategory.find(params[:id])

  end
  def public_search
    redirect_to :controller => 'public', :action => 'recipe', :id => params[:id]
  end
  def recipe
    @recipe = Recipe.find(params[:id])    
  end

  def subcategories
    @category = Category.find(params[:id])    
    @subcategories = Subcategory.find_all_by_category_id(params[:id])
  end

end
