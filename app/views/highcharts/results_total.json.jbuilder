json.title do
  json.text "Despesas"
end
json.subtitle do
  json.text t(:performance)
end
json.min 0
json.max 3000
json.series @testes do |teste|
    json.data [
        name: teste.month,
        y: teste.income_value.to_f
    ]
end
  

