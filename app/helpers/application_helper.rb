module ApplicationHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  def gravatar_url(email)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}"
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
