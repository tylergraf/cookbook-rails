class ApplicationController < ActionController::Base
  protect_from_forgery
  def categories
    @categories = Category.all
  end


  protected

  def confirm_admin_logged_in
    unless session[:user_admin]
      flash[:notice] = "Please log in."
      redirect_to(:controller =>'access', :action => 'login')
      false
    else
      true
    end
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller =>'access', :action => 'login')
      false
    else
      true
    end
  end
end
