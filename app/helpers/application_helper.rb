module ApplicationHelper
  def info_hidden(options = {})
    content_tag :div, '', id: 'info_hidden', class: 'hidden', data: options
  end

  def show_check(record)
    if record.present?
      content_tag(:i, '', class: 'fa fa-check')
    else
      content_tag(:i, '', class: 'fa fa-times')
    end
  end

  def number_to_euro(amount)
    number_to_currency(amount, :unit=>'€')
  end

  def link_to_add_fields(name = nil, form = nil, association = nil, options = nil, html_options = nil, &block)
    # If a block is provided there is no name attribute and the arguments are
    # shifted with one position to the left. This re-assigns those values.
    if block_given?
      html_options = options
      options = association
      association = form
      form = name
    end

    options ||= {}
    html_options ||= {}

    locals = options[:locals] || {}
    partial = options[:partial] || "#{association.to_s.singularize}_fields"

    # Render the form fields from a file with the association name provided
    new_object = form.object.class.reflect_on_association(association).klass.new
    fields = form.fields_for(association, new_object, child_index: 'new_record') do |builder|
      render partial, locals.merge!(f: builder)
    end

    # The rendered fields are sent with the link within the data-form-prepend attr
    html_options['data-form-prepend'] = raw CGI.escapeHTML(fields)
    html_options[:href] = '#'

    content_tag :a, name, html_options, &block
  end

  def audited_changes(object)
    if object.class.name.in? Apartment.excluded_models
      Apartment::Tenant.switch do
        query_sql = "audited_changes -> '#{object.class.name.foreign_key}' = '#{object&.id}'"
        Audited::Audit.where(query_sql).or(Audited::Audit.where(auditable: object)).reorder(id: :desc)
      end
    else
      query_sql = "audited_changes -> '#{object.class.name.foreign_key}' = '#{object&.id}'"
      Audited::Audit.where(query_sql).or(Audited::Audit.where(auditable: object)).reorder(id: :desc)
    end
  end

  def weights_action?
    action_name.in? %w[weights weights_edit weights_update]
  end

  def weightsbar(percentage, measurement_unit:)
    content_tag :div, class: 'progress progress-md m-b-0' do
      content_tag(
        :div,
        formated_value(percentage, measurement_unit: measurement_unit),
        class: 'progress-bar progress-bar-inverse',
        role: 'progressbar',
        aria: { valuenow: percentage.to_i, valuemin: 0, valuemax: 100 },
        style: "width: #{percentage.to_i}%"
      )
    end
  end

  def progress_bar(spent)
    boundaries = ['success', 'warning', 'danger']
    if spent > 99
      bgcolor = boundaries[2]
    elsif spent >= 90 
      bgcolor = boundaries[1]
    elsif spent < 90
      bgcolor = boundaries[0]
    end

    content_tag :div, 
                '', 
                class: "progress-bar bg-#{bgcolor}", 
                role: 'progressbar',
                aria: 
                  { valuenow: spent, valuemin: 0, valuemax: 100 }, 
                style: "width: #{spent}%"
      
  end

  def valid_sheet_name(name)
    max_sheet_name_size = 31
    invalid_chars = %r{[\[\]\*/\\\?\:]}
    truncate(name.to_s, length: max_sheet_name_size, escape: false).gsub(invalid_chars, '_')
  end

  def show_expense(expense)
    month = (Current.month - 1)
    expenses = Expense.where('month = ? AND annual_management_id = ?', month, AnnualManagement.find_by(year: Current.year).id)
    return "background-color: rgb(171, 0, 0); !important" if expenses.blank?

    expenses.each do |e|
      status = ExpenseGroup.where(expense: e).find_by(expense_category: expense)
      if status.present?
        return "background-color: rgb(5, 93, 0); !important"
      else
        return "background-color: rgb(171, 0, 0); !important"
      end
    end
  end

  def expense_button(expense)
    month = (Current.month - 1)
    expenses = Expense.where('month = ? AND annual_management_id = ?', month, AnnualManagement.find_by(year: Current.year).id)
    
    return new_expense_path if expenses.blank?
    
    expenses.each do |e|
      status = ExpenseGroup.where(expense: e).find_by(expense_category: expense)
      if status.present?
        return edit_expense_path(e.id)
      else
        return new_expense_path
      end
    end
  end

  def expense_value(expense)
    month = (Current.month - 1)
    expenses = Expense.where('month = ? AND annual_management_id = ?', month, AnnualManagement.find_by(year: Current.year).id)
    
    return "<span>Atenção!</span><br><span>Pagar</span>".html_safe if expenses.blank?
    expenses.each do |e|
      status = ExpenseGroup.where(expense: e).find_by(expense_category: expense)
      if status.present?
        return "<span>Pago<i class='far fa-check-square ml-2'></i></span><br><span>#{number_to_euro(status.expense_value)}</span>".html_safe
      else
        return "<span>Atenção!</span><br><span>Pagar</span>".html_safe
      end
    end
  end
end
  