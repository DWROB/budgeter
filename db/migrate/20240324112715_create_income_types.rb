class CreateIncomeTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :income_types do |t|
      t.string :name
      t.boolean :flg_deleted, default: false

      t.timestamps
    end
  end
end
