class ApplicationDatatable
    delegate :params, to: :@view
    delegate :raw, to: :@view
    delegate :link_to, to: :@view
    delegate :content_tag, to: :@view
    delegate :t, to: :@view
    
    def initialize(view)
      @view = view
    end
  
    def as_json(_options = {})
      if valid?
        {
          draw: params[:draw].to_i,
          recordsTotal: count,
          recordsFiltered: total_entries,
          data: data
        }
      else
        {
          draw: params[:draw].to_i,
          recordsTotal: 0,
          recordsFiltered: 0,
          data: []
        }
      end
    end
  
    private
  
    def page
      params[:start].to_i / per_page + 1
    end
  
    def per_page
      params[:length].to_i.positive? ? params[:length].to_i : 10
    end
  
    def sort_column
      order_columns[params[:order]['0'][:column].to_i] rescue order_columns[0]
    end
  
    def sort_direction
      params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc' rescue 'desc'
    end
end
  