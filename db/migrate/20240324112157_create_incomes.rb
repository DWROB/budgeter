class CreateIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.decimal :amount
      t.string :source
      t.boolean :flg_deleted, default: false

      t.references :users
      t.references :income_types
      t.timestamps
    end
  end
end
