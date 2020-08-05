module ApplicationHelper
  def sort_link_turbo(attribute, *args)
    sort_link(attribute, *args.push({}, { data: { turbolinks_action: 'replace' } }))
  end

  def icon(klass, text = nil)
    icon_tag = tag.i(class: klass)
    text_tag = tag.span text
    text ? tag.span(icon_tag + text_tag) : icon_tag
  end
end
