module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user. Can change. Should change! 
   def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}" # use this image rather 
    																#:http://www.adinkra.org/images/nyameohene_lg.gif
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end