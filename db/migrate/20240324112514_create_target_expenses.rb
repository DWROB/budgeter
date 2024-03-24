class CreateTargetExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :target_expenses do |t|
      t.string :name
      t.decimal :amount
      t.string :supplier
      t.string :product_url
      t.boolean :flg_deleted, default: false

      t.references :users
      t.timestamps
    end
  end
end
