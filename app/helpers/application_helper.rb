module ApplicationHelper

  def cover_image(comic)
    if comic.cover_img_url.present?
      image_tag(comic.cover_img_url)
    else
      image_tag(comic.cover_image)
    end
  end

  def element_image(element)
    if element.image_url.present?
      image_tag(element.image_url)
    else
      image_tag(element.image_file)
    end
  end

end
