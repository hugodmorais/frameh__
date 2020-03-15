module ExpenseCategoriesHelper
    def show_icon(icon)
        content_tag(:em, icon.html_safe, class: "fa fa-power-off")
    end
end
