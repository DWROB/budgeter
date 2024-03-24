class Balance < ApplicationRecord
    belongs_to :user, optional: true
end
