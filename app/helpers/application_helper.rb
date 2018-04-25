module ApplicationHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def emojify(content)
  h(content).to_str.gsub(/:([\w+-]+):/) do |match|
    if emoji = Emoji.find_by_alias($1)
      %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
    else
      match
    end
  end.html_safe if content.present?
end

  def gravatar_url(email)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "https://www.gravatar.com/avatar/#{gravatar}"
  end
  def small_gravatar_url(email)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "https://www.gravatar.com/avatar/#{gravatar}?s=30"
  end
  def large_gravatar_url(email)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "https://www.gravatar.com/avatar/#{gravatar}?s=512px"
  end
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
end

  def active_item(uri)
    uri_segments = request.fullpath.split(/\/|\?/)
    uri_segments[1]. === uri ? 'active' : ''
  end
  def has_error?(resource, field)
    resource.errors.messages[field].present?
  end

end
