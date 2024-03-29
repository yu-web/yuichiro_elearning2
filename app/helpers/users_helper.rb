module UsersHelper
  def gravatar_for(user)
    #generate hex token
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  
    image_tag(gravatar_url,alt:user.name)
  
  end
end
