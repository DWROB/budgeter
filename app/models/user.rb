class User < ApplicationRecord
    has_many :expenses
    has_many :incomes
    has_many :target_expenses
    has_one :balance
end
