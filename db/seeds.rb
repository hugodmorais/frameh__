# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
AnnualManagement.destroy_all
Company.destroy_all
UserGroup.destroy_all

user = User.create!( name: 'Hugo Morais', email: 'hugomorais@gmail.com', password: '123456', admin: true )
user1 = User.create!( name: 'Kenia Soares', email: 'kenia@gmail.com', password: '123456' )

year4 = AnnualManagement.create!( year: '2014', description: 'Um' )
year5 = AnnualManagement.create!( year: '2015', description: 'Dois' )
year6 = AnnualManagement.create!( year: '2016', description: 'Tres' )
year6 = AnnualManagement.create!( year: '2017', description: 'Quatro' )
year = AnnualManagement.create!( year: '2018', description: 'Cinco' )
year1 = AnnualManagement.create!( year: '2019', description: 'Seis' )
year2 = AnnualManagement.create!( year: '2020', description: 'Sete' )

work = Company.create!( name: 'Aquapor', country: 'Portugal', city: 'Lisboa', user: user )
work1 = Company.create!( name: 'Sebo', country: 'Brasil', city: 'Ji-Paraná', user: user )
work2 = Company.create!( name: 'Italian Burguer', country: 'Portugal', city: 'Lisboa', user: user )
work3 = Company.create!( name: 'McDonalds', country: 'Portugal', city: 'Lisboa', user: user )

companies = Company.create!( name: 'Ecox', country: 'Portugal', city: 'Lisboa', user: user1 )
companies1 = Company.create!( name: 'Italian Republic', country: 'Portugal', city: 'Lisboa', user: user1 )
companies2 = Company.create!( name: 'Farmácia Santa Rita', country: 'Brasil', city: 'Lisboa', user: user1 )
companies3 = Company.create!( name: 'Vendas', country: 'Brasil', city: 'Ji-Paraná', user: user1 )

user_group = UserGroup.create!( first_name: 'Hugo', last_name: 'Morais', genre: '0', user: user, birth_date: '29/05/1985' )
user_group1 = UserGroup.create!( first_name: 'Michael', last_name: 'Morais', genre: '0', user: user, birth_date: '9/04/1965' )
user_group2 = UserGroup.create!( first_name: 'Will', last_name: 'Morais', genre: '0', user: user, birth_date: '2/01/1975' )
user_group3 = UserGroup.create!( first_name: 'Johnny', last_name: 'Morais', genre: '0', user: user, birth_date: '29/05/2000' )

user_groups = UserGroup.create!( first_name: 'Kenia', last_name: 'Soares', genre: '1', user: user1, birth_date: '25/04/1987' )
user_groups1 = UserGroup.create!( first_name: 'Madonna', last_name: 'Soares', genre: '1', user: user1, birth_date: '9/04/1910' )
user_groups2 = UserGroup.create!( first_name: 'Obama', last_name: 'Soares', genre: '0', user: user1, birth_date: '2/01/1915' )
user_groups3 = UserGroup.create!( first_name: 'Michael', last_name: 'Soares', genre: '0', user: user1, birth_date: '29/05/1500' )

work_group = WorkGroup.create!(start_at: '29/05/2000', end_at: '', company: work, user_group: user_group )
work_group1 = WorkGroup.create!(start_at: '29/05/2000', end_at: '10/02/2020', company: work1, user_group: user_group1 )
work_group2 = WorkGroup.create!(start_at: '29/05/2000', end_at: '20/8/2021', company: work2, user_group: user_group2 )

work_group3 = WorkGroup.create!(start_at: '29/05/2000', end_at: '', company: companies, user_group: user_groups )
work_group4 = WorkGroup.create!(start_at: '29/05/2000', end_at: '10/02/2020', company: companies1, user_group: user_groups1 )
work_group5 = WorkGroup.create!(start_at: '29/05/2000', end_at: '20/8/2021', company: companies2, user_group: user_groups2 )


