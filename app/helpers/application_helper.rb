module ApplicationHelper

  def load_page_specific_javascripts(*files)
    content_for(:page_specific_scripts) { javascript_include_tag(*files) }
  end
end
