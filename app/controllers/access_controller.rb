class AccessController < ApplicationController
  layout 'admin'
  #before_filter :confirm_logged_in, :except => [:login, :attempt_login]

  def index
    menu
    render('menu')
  end

  def menu

  end

  def login

  end


  def attempt_login
    authorized_user = AdminUser.authenticate(params[:email], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:user_email] = authorized_user.email
      session[:user_admin] = authorized_user.admin
      flash[:notice] = "You are now logged in."
      redirect_to(:controller => 'categories')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_email] = nil
    session[:user_admin] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end


end
