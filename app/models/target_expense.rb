class TargetExpense < ApplicationRecord
    belongs_to :user, optional: true
end
