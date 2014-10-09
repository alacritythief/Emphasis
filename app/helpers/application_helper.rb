module ApplicationHelper

  def cover_image(comic)
    if comic.cover_img_url.present?
      image_tag(comic.cover_img_url)
    else
      image_tag(comic.cover_image)
    end
  end

end
