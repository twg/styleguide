module ApplicationHelper

  def icon(type, text = '', options = {})
    options[:class] ||= ''
    options[:class] << " icon icon-#{type}"
    (content_tag(:i, '', options) + ' ' + text).html_safe
  end

end
