module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = {size:10},title = user.firstname)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.firstname, class: "gravatar")
  #  image_tag gravatar_image_url(user.email, size: 50), title: title, class: 'img-rounded'
  end
end
