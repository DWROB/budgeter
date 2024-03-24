class CreateBalances < ActiveRecord::Migration[7.1]
  def change
    create_table :balances do |t|
      t.decimal :total

      t.references :incomes
      t.references :expenses
      t.references :users

      t.timestamps
    end
  end
end
