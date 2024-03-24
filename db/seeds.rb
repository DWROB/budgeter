# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts 'seeding beginning...'
user = User.find(1)

puts "#{user.username} is the user"

puts 'making expense types ...'

ExpenseType.destroy_all

expense_types = [
    'home',
    'groceries',
    'eating out',
    'entertainment',
    'vet'
]

expense_types.each do |type|
    #create some expense types
    ExpenseType.create(
        name: type,
        flg_deleted: false
    )

end

puts 'making expenses ...'

Expense.destroy_all

50.times do
    # create expenses
    # randomly assign a value from 0 - 7
    Expense.create(
        supplier: Faker::Company.name,
        expense_types_id: ExpenseType.all.sample.id,
        amount: Faker::Number.decimal(l_digits: 2),
        users_id: user.id
    )
end

puts 'making income types...'

IncomeType.destroy_all

income_types = [
    'salary',
    'gift',
    'interest'
]

income_types.each do |type|
   IncomeType.create(name: type)
end

puts 'making incomes ...'

Income.destroy_all

10.times do
    # create some incomes
    Income.create(
        source: Faker::Bank.name,
        income_types_id: IncomeType.all.sample.id,
        amount: Faker::Number.decimal(l_digits: 2),
        users_id: user.id
    )
end

puts 'done'
