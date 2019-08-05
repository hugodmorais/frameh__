json.title do
  json.text "Despesas"
end
json.series @testes do |teste|
  json.child! do
    json.data [
        name: teste.month,
        y: teste.income_value.to_f
    ]
  end
end

