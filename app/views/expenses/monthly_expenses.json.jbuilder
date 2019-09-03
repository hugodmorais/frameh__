json.month Current.month
json.expenses @expenses do |expense|
  json.id expense.id
  json.strategic_score expense.expense_groups.each do |expense_group|
     expense_group.expense_value
  end
end
