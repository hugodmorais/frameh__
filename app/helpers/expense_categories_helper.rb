module ExpenseCategoriesHelper
  def show_icon(icon)
    content_tag(:em, icon.html_safe)
  end
end
