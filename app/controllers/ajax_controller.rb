class AjaxController < ApplicationController
  layout 'ajax'

  def subcategories
    @subcategories = Subcategory.order('subcategory ASC').find_all_by_category_id(params[:cat])
    respond_to do |format|
      format.html  { render :html => @subcategories }
      format.json  { render :json => @subcategories }
    end
  end

  def recipes
    @recipes = Recipe.order('title ASC').find_all_by_subcategory_id(params[:subcat])
  end
  def search_ajax
    @recipes = Recipe.order('title ASC').where(['title LIKE ?', "%#{params[:q]}%"]).limit(20)
    respond_to do |format|
      format.html  { render :html => @recipes }
      format.json  { render :json => @recipes }
    end
  end
  def search
    redirect_to :controller => 'recipes', :action => 'show', :id => params[:id]
  end
end
