class AlterAmountColumnsToInteger < ActiveRecord::Migration[7.1]
  def change
    remove_column(:expenses, :amount)
    remove_column(:incomes, :amount)
    remove_column(:balances, :total)

    add_column(:expenses, :amount, :integer)
    add_column(:incomes, :amount, :integer)
    add_column(:balances, :amount, :integer)
  end
end
