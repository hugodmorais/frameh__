json.title do
    json.text t(:historical_performance)
  end
  json.set! 'yAxisTitle' do
    json.text t(:performance)
  end
  json.series do
    json.child! do
      json.type 'column'
      json.name t(:real_value)
      indexed_results = @testes.index_by(&:month)
      json.data 1..12 do |month|
        if indexed_results[month].present?
            json.y indexed_results[month].income_value.to_f
        else
          json.y nil
        end
      end
    end
    json.child! do
        json.type 'column'
        json.name t(:real_value)
        indexed_results = @testes.index_by(&:month)
        json.data 1..12 do |month|
          if indexed_results[month].present?
              json.y indexed_results[month].income_value.to_f
          else
            json.y nil
          end
        end
      end
end
  