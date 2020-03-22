namespace :seed_example do
  desc 'Prepare example for User.first'
  task hugomorais: :environment do |task, _args|
    user = User.find_by(email: "hugomorais@gmail.com")

  # Create AnnualManagement
  [2018, 2019, 2020].each do |year|
    annual_management = AnnualManagement.create!(
    year: year,
    description: year
  )
  end

  # Create Incomes Categories
  IncomeCategory.create!( name: 'Salário' )
  IncomeCategory.create!( name: 'Sub. férias' )
  IncomeCategory.create!( name: 'Sub. Natal' )
  IncomeCategory.create!( name: 'Horas Extra' )
  
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