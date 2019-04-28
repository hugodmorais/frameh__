# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
AnnualManagement.destroy_all
Work.destroy_all
UserGroup.destroy_all

user = User.create!( name: 'Hugo Morais', email: 'hugomorais@gmail.com', password: '123456', admin: true )
user.image.attach(io: File.open('app/assets/images/daryl.jpg'), filename: 'daryl.jpg')
user1 = User.create!( name: 'Kenia Soares', email: 'kenia@gmail.com', password: '123456' )
user1.image.attach(io: File.open('app/assets/images/angelina.jpg'), filename: 'angelina.jpg')

year = AnnualManagement.create!( year: '2018', description: 'um' )
year1 = AnnualManagement.create!( year: '2019', description: 'dois' )
year2 = AnnualManagement.create!( year: '2020', description: 'tres' )

work = Work.create!( name: 'Aquapor', country: 'Portugal', city: 'Lisboa', user: user )
work1 = Work.create!( name: 'Sebo', country: 'Brasil', city: 'Ji-Paraná', user: user )
work2 = Work.create!( name: 'Italian Burguer', country: 'Portugal', city: 'Lisboa', user: user )
work3 = Work.create!( name: 'McDonalds', country: 'Portugal', city: 'Lisboa', user: user )

works = Work.create!( name: 'Ecox', country: 'Portugal', city: 'Lisboa', user: user1 )
works1 = Work.create!( name: 'Italian Republic', country: 'Portugal', city: 'Lisboa', user: user1 )
works2 = Work.create!( name: 'Farmácia Santa Rita', country: 'Brasil', city: 'Lisboa', user: user1 )
works3 = Work.create!( name: 'Vendas', country: 'Brasil', city: 'Ji-Paraná', user: user1 )

user_group = UserGroup.create!( first_name: 'Hugo', last_name: 'Morais', genre: '0', user: user, birth_date: '29/05/1985' )
user_group.image.attach(io: File.open('app/assets/images/daryl.jpg'), filename: 'daryl.jpg')
user_group1 = UserGroup.create!( first_name: 'Michael', last_name: 'Morais', genre: '0', user: user, birth_date: '9/04/1965' )
user_group1.image.attach(io: File.open('app/assets/images/angelo.jpg'), filename: 'angelo.jpg')
user_group2 = UserGroup.create!( first_name: 'Will', last_name: 'Morais', genre: '0', user: user, birth_date: '2/01/1975' )
user_group2.image.attach(io: File.open('app/assets/images/cel02.jpg'), filename: 'cel02.jpg')
user_group3 = UserGroup.create!( first_name: 'Johnny', last_name: 'Morais', genre: '0', user: user, birth_date: '29/05/2000' )
user_group3.image.attach(io: File.open('app/assets/images/Johnny.jpg'), filename: 'Johnny.jpg')

user_groups = UserGroup.create!( first_name: 'Kenia', last_name: 'Soares', genre: '1', user: user1, birth_date: '25/04/1987' )
user_groups.image.attach(io: File.open('app/assets/images/angelina.jpg'), filename: 'angelina.jpg')
user_groups1 = UserGroup.create!( first_name: 'Madonna', last_name: 'Soares', genre: '1', user: user1, birth_date: '9/04/1910' )
user_groups1.image.attach(io: File.open('app/assets/images/madonna.jpg'), filename: 'madonna.jpg')
user_groups2 = UserGroup.create!( first_name: 'Obama', last_name: 'Soares', genre: '0', user: user1, birth_date: '2/01/1915' )
user_groups2.image.attach(io: File.open('app/assets/images/obama.jpg'), filename: 'obama.jpg')
user_groups3 = UserGroup.create!( first_name: 'Michael', last_name: 'Soares', genre: '0', user: user1, birth_date: '29/05/1500' )
user_groups3.image.attach(io: File.open('app/assets/images/michael-jackson.jpg'), filename: 'michael-jackson.jpg')

work_group = WorkGroup.create!(start_at: '29/05/2000', end_at: '', work: work, user_group: user_group )
work_group1 = WorkGroup.create!(start_at: '29/05/2000', end_at: '10/02/2020', work: work1, user_group: user_group1 )
work_group2 = WorkGroup.create!(start_at: '29/05/2000', end_at: '20/8/2021', work: work2, user_group: user_group2 )

work_group3 = WorkGroup.create!(start_at: '29/05/2000', end_at: '', work: works, user_group: user_groups )
work_group4 = WorkGroup.create!(start_at: '29/05/2000', end_at: '10/02/2020', work: works1, user_group: user_groups1 )
work_group5 = WorkGroup.create!(start_at: '29/05/2000', end_at: '20/8/2021', work: works2, user_group: user_groups2 )


