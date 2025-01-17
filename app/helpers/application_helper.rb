module ApplicationHelper
  include Pagy::Frontend

  def pagination(object)
    raw(pagy_bootstrap_nav(object)) if object.pages > 1
  end

  def nav_tab(title, url, options = {})
    current_page = options.delete :current_page

    css_class = current_page == title ? 'text-secondary' : 'text-white'

    options[:class] = if options[:class]
                        options[:class] + ' ' + css_class
                      else
                        css_class
                      end
    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/menu', locals: { current_page: current_page }
  end

  def full_title(page_title = '')
    if page_title.present?
      "#{page_title} | AskIt"
    else
      'AskIt'
    end
  end
end
