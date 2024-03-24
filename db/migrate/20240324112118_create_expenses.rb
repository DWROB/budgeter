class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :supplier
      t.decimal :amount
      t.boolean :flg_deleted, default: false

      t.references :users
			t.references :expense_types
      t.timestamps
    end
  end
end
