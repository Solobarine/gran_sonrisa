module ApplicationHelper
    def is_active?(path)
      current_page?(path) ? 'active' : ''
    end
end
