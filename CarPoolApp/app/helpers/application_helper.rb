module ApplicationHelper
  #return title of the page
  def full_title(page_title = '')
    base_title = "SFYouRide"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end


#  def gravatar_for(user, size = 50, title = user.firstname)
#    image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
#  end

def gravatar_for(user, options = {size:50})
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  image_tag(gravatar_url, alt: user.firstname, class: "gravatar")
end
end
