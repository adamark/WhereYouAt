class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_user! 
  
  helper_method :current_user, :current_user?, :twitter_name, :twitter_pic
  
  def current_user
    @current_user ||= User.find_by_id(cookies[:user_id]) # rescue nil
  end
  
  def current_user?
    current_user.present?
  end
  
  def login_user!
    if current_user.nil? 
      redirect_to login_url
    end
  end
  
  def logout
    cookies.delete(:user_id)
    redirect_to login_url
  end
  
  def twitter_name
    twitter = Twitter.user(@user.name)
    profile = twitter[:attrs]["name"]
  end
  
  def twitter_pic
    twitter = Twitter.user(@user.name)
    profile = twitter[:attrs]["profile_image_url"]
    image_tag( profile, class: "twit-img")
  end
end
