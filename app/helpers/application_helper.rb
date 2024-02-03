# frozen_string_literal: true
module ApplicationHelper
  def tailwind_paginate(objects)
    will_paginate objects, renderer: TailwindPagination::Rails
  end
end

