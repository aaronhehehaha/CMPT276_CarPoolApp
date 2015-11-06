module ApplicationHelper
  #return title of the page
  def full_title(page_title = '')
    base_title = "Car Pool App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
