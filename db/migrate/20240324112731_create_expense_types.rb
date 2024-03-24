class CreateExpenseTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :expense_types do |t|
      t.string :name
      t.boolean :flg_deleted, default: false

      t.timestamps
    end
  end
end
