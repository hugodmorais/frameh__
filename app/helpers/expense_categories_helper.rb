module ExpenseCategoriesHelper
  def show_icon(icon)
    content_tag(:em, icon.html_safe)
  end

  def show_primary_payment(payment)
    if payment.present?
      content_tag(:i, '', class: 'fa fa-check')
    else
      content_tag(:i, '', class: 'fa fa-check')
    end
  end
end
