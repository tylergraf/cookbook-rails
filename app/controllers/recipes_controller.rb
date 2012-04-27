class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
  layout 'admin'
  #before_filter :confirm_admin_logged_in


  def index
    @recipe = Recipe.find(params[:id])

  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new
    @categories = Category.order('category ASC').all
    @subcategories = Subcategory.order('subcategory ASC').find_all_by_category_id(4)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
      format.json  { render :json => @subcategories }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.order('category ASC').all
    @subcategories = Subcategory.order('subcategory ASC').find_all_by_id(params[:subcategory])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(:controller => 'recipes',:id=>@recipe.id) }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
        format.js   { render :nothing => true }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
        format.js   { render :nothing => false }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => 'categories', :notice => 'Recipe Deleted Successfully') }
      format.js   { render :nothing => true }

    end
  end


end
