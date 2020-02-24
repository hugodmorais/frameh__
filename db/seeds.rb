# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ContractStatus.destroy_all

user = User.create!( name: 'Hugo Morais', email: 'hugomorais@gmail.com', password: '123456', admin: true )
user1 = User.create!( name: 'Kenia Soares', email: 'kenia@gmail.com', password: '123456' )

ContractStatus.create!(
    [
      { key: ContractStatus::ACTIVE_STATUS_KEY, name: 'Ativo' },
      { key: ContractStatus::INACTIVE_STATUS_KEY, name: 'Inativo' },
      { key: ContractStatus::PENDING_STATUS_KEY, name: 'Pendente' },
      { key: ContractStatus::CANCELED_STATUS_KEY, name: 'Cancelado' }
    ]
  )

ExpenseCategory.create!(
  [
    { name: 'Energia' },
    { name: 'Gás' },
    { name: 'Água' },
    { name: 'Internet' }
  ]
)



