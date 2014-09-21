class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :value
      t.boolean :status
      t.integer :debtor_id
      t.integer :billing_id

      t.timestamps
    end
    add_index :debts, [:debtor_id]
    add_index :debts, [:billing_id]
    add_index :debts, [:created_at]
    add_index :debts, [:status]
  end
end
