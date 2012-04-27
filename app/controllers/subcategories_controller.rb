class SubcategoriesController < ApplicationController
layout 'admin'
  #before_filter :confirm_admin_logged_in

  def index
    @category = Category.find(params[:id])
    @subcategories = Subcategory.find_all_by_category_id(params[:id])
    @subcategory = Subcategory.new
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @subcategory = Subcategory.new(:subcategory)
    @categories = Category.order('categories.category ASC')
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
      format.js  { render :json => @subcategories }
    end
  end

  def create
    @subcategory = Subcategory.new(params[:subcategory])
    if @subcategory.save
      respond_to do |format|
          format.js   { render :json => @subcategory}
          format.html { redirect_to(@subcategory) }
      end
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
    end
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
    @categories = Category.order('categories.category ASC')
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes(params[:subcategory])
#      flash[:notice] = "Subcategory updated successfully"
      respond_to do |format|
          format.js   { render :json => @subcategory}
          format.html { redirect_to(@subcategory) }
      end
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
#    flash[:notice] = "Subcategory deleted successfully"
    @subcategory.destroy
    redirect_to(:action => 'index', :id => @subcategory.category_id)

  end

end

