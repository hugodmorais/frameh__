module ApplicationHelper
  def info_hidden(options = {})
    content_tag :div, '', id: 'info_hidden', class: 'hidden', data: options
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

  def valid_sheet_name(name)
    max_sheet_name_size = 31
    invalid_chars = %r{[\[\]\*/\\\?\:]}
    truncate(name.to_s, length: max_sheet_name_size, escape: false).gsub(invalid_chars, '_')
  end

  def show_expense(expense)
    month = (Current.month - 1)
    expenses = Expense.where('month = ? AND annual_management_id = ?', month, AnnualManagement.find_by(year: Current.year))
    
    expenses.each do |e|
      status = ExpenseGroup.where(expense: e).find_by(expense_category: expense)
      if status.present?
        return "background-color: #00FA9A; !important"
      else
        return "background-color: #FF0000; !important"
      end
    end
  end
end
  