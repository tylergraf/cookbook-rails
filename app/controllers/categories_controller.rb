class CategoriesController < ApplicationController
  layout 'admin'
  #before_filter :confirm_admin_logged_in
  def index
    @categories = Category.order('categories.category ASC')
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        categories = ActiveSupport::JSON
        categories = categories.encode({:categories => @categories})
        render json: categories
      }
    end
  end

  def new
    @category = Category.new(:category)
  end

  def create
    @subject = Category.new(params[:category])
    if @subject.save
      flash[:notice] = "Category created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def destroy
    @category = Category.find(params[:id])
    flash[:notice] = "Category deleted successfully"    
    @category.destroy
    redirect_to(:action => 'index')

  end
  
end
