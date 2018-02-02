module ApplicationHelper
  def site_title
    'Ocean+ Data'
  end 

  def site_description
    'Ocean+ Data provides an overview of global marine and coastal datasets of biodiversity importance. It can be thought of as a library of available ocean-related resources that can be found online, providing information on and links to these resources.'
  end

  def title_meta_tag
    content_for?(:title) ? "#{content_for(:title)} | #{site_title}"  : site_title
  end

  def page_title
    content_for?(:title) ? content_for(:title) : site_title
  end

  def social_image
    image_url('social-ocean-plus-turtle.jpg')
  end

  def create_class string
    string.downcase.tr("/ |_/", "-")
  end

  def remove_spaces string
    string.downcase.gsub(" ", "")
  end

  def url_encode text
    ERB::Util.url_encode(text)
  end

  def encoded_home_url
    url_encode(request.base_url)
  end

  def create_social_facebook_link
    title = url_encode('Share ' + page_title + ' on Facebook')
    url = encoded_home_url
    href = 'https://facebook.com/sharer/sharer.php?u=' + url

    link_to '', href, title: title, class: 'icon--social icon--social-facebook', target: '_blank'
  end

  def create_social_linkedin_link
    title = url_encode('Share ' + page_title + ' on LinkedIn')
    url = encoded_home_url
    href = 'https://www.linkedin.com/shareArticle?url=' + url

    link_to '', href, title: title, class: 'icon--social icon--social-linkedin', target: '_blank'
  end

  def create_social_twitter_link
    title = url_encode('Share ' + page_title + ' on Twitter')
    text = url_encode('Ocean+ Data provides an overview of global marine and coastal datasets of biodiversity importance.')
    url = encoded_home_url
    href = 'https://twitter.com/intent/tweet/?text=' + text + '&url=' + url
    
    link_to '', href, title: title, class: 'icon--social icon--social-twitter', target: '_blank'
  end

  def create_social_email_link
    title = url_encode('Share ' + page_title + ' via Email')
    url = encoded_home_url
    subject = url_encode(site_title)
    body = site_description + url_encode("\n\n") + url
    href = 'mailto:?subject=' + subject + '&body=' + body

    link_to '', href, title: title, class: 'icon--social icon--social-email', target: '_self'
  end
end
