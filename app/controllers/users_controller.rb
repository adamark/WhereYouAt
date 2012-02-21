class UsersController < ApplicationController
  skip_before_filter :login_user!, :only => [:new, :create]
  
  def new
    @user = User.new
    # @already_user = User.find(params[:id])
  end
  
  def edit
    @user = current_user
  end
  
  def index
    @users = User.all
    
    @user = current_user
    # @user = User.find(params[:id])
    
    @academy = User.where(:location => "Academy")
    @cloud = User.where(:location => "Cloud")
    
  end
  
  def create
    @user = User.new(params[:user])
    # already_user = User.find(params[:name])
    
    if @user.valid?
      @user.save
      cookies.permanent[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to login_url
      flash.now[:error] = "We already have you in the db!"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_url
    else
      render 'edit'
    end
  end

  
  
end
