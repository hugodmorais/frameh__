namespace :seed_example do
  desc 'Prepare example for User.first'
  task hugomorais: :environment do |task, _args|
    user = User.find_by(email: "hugomorais@gmail.com")

  # Create AnnualManagement
  [2018, 2019, 2020].each do |year|
    annual_management = AnnualManagement.create!(
    year: year,
    description: year,
    user_id: user.id
  )
  end

  # Create Incomes Categories
  IncomeCategory.create!( name: 'Salário', user: user )
  IncomeCategory.create!( name: 'Sub. férias', user: user )
  IncomeCategory.create!( name: 'Sub. Natal', user: user )
  IncomeCategory.create!( name: 'Horas Extra', user: user )

  # Create Expense Categories
  ExpenseCategory.create!( name: 'Energia', primary_payment: true, icon: 'fas fa-battery-three-quarters', user: user )
  ExpenseCategory.create!( name: 'Gás', primary_payment: true, icon: 'fas fa-fire', user: user )
  ExpenseCategory.create!( name: 'Água', primary_payment: true, icon: 'fa fas fa-tint', user: user )
  ExpenseCategory.create!( name: 'Vodafone', primary_payment: true, icon: 'fas fa-mobile', user: user )
  ExpenseCategory.create!( name: 'Mercado', primary_payment: false, icon: 'fas fa-shopping-cart', user: user )
  ExpenseCategory.create!( name: 'Seguro Carro', primary_payment: false, icon: 'fas fa-car', user: user )
  ExpenseCategory.create!( name: 'Formação', primary_payment: false, icon: 'fas fa-university', user: user )
  ExpenseCategory.create!( name: 'Combustivel', primary_payment: false, icon: 'fas fa-hashtag', user: user )

  # Create ContractStatus
  ContractStatus.create!( name: 'Pendente', user: user)
  ContractStatus.create!( name: 'Cancelado', user: user)
  ContractStatus.create!( name: 'Em Execução', user: user)
  ContractStatus.create!( name: 'Fechado', user: user)
  
  # Create Companies
  Company.create!( name: 'Aquapor', country: 'Portugal', city: 'Lisboa', user: user )
  Company.create!( name: 'Sebo', country: 'Brasil', city: 'Ji-Paraná', user: user )
  Company.create!( name: 'Italian Burguer', country: 'Portugal', city: 'Lisboa', user: user )
  Company.create!( name: 'McDonalds', country: 'Portugal', city: 'Lisboa', user: user )

  # Create UserGroup
  UserGroup.create!( name: 'Hugo', genre: '0', user: user, birth_date: '29/05/1985' )
  UserGroup.create!( name: 'Kenia', genre: '1', user: user, birth_date: '9/04/1965' )
  UserGroup.create!( name: 'Jose', genre: '0', user: user, birth_date: '2/01/1975' )

  end        
end