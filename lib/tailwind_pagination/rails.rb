require 'will_paginate/view_helpers/action_view'

module TailwindPagination
  class Rails < WillPaginate::ActionView::LinkRenderer
    def container_attributes
      {class: "flex space-x-1"}
    end

    def page_number(page)
      unless page == current_page
        link(page, page, rel: rel_value(page), class: "px-4 py-2 border rounded text-blue-500 hover:bg-blue-500 hover:text-white")
      else
        tag(:em, page, class: "px-4 py-2 border rounded bg-blue-500 text-white")
      end
    end

    def previous_or_next_page(page, text, classname,_extra_arg = nil)
      if page
        link(text, page, class: "px-4 py-2 border rounded text-blue-500 hover:bg-blue-500 hover:text-white")
      else
        tag(:span, text, class: "px-4 py-2 border rounded text-gray-500")
      end
    end
  end
end
