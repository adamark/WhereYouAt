module UsersHelper
  def status
    @academy.status != "I'm there!"
    @cloud.status != "I'm there!"
  end
  
  def twitter(handle)
    @user = User.new(params[:user])
    twitter = Twitter.user(handle.name)
    profile = twitter[:attrs]["name"]

  end
  
  def twitterpic(handle)
    @user = User.new(params[:user])
    twitter = Twitter.user(handle.name)
    profile_pic = twitter[:attrs]["profile_image_url"]

  end
  
  def first_name
    @user.name.split(' ')[0]   
  end
  
  def already_exist?(user_name)
    t_name = Twitter.user(user_name)
    other = User.find_by_id(params[:id])
    t_name 
  end
end
