json.title do
  json.text "Receitas vs Despesas - #{Current.year}"
end
json.set! 'yAxisTitle' do
  json.text "Receitas"
end
json.categories t('date.abbr_month_names').compact
json.series do
  json.child! do
    json.type 'column'
    json.name "Receitas"
    indexed_results = @incomes
    json.data 1..12 do |month|
      if indexed_results.present?
        json.y indexed_results.where(month: month).sum('income_value').to_f
      else
        json.y nil
      end
    end
    json.color '#055D00'
  end
  json.child! do
    json.type 'column'
    json.name "Despesas"
    indexed_results = @expenses
    json.data 1..12 do |month|
      if indexed_results.present?
          json.y Expense.joins(:expense_groups).where(month: month).sum('expense_value')
      else
        json.y nil
      end
    end
    json.color '#AB0000'
  end
end
  