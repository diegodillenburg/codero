class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :name
      t.decimal :value
      t.string :description
      t.boolean :status
      t.integer :creditor_id

      t.timestamps
    end
    add_index :billings, [:creditor_id]
    add_index :billings, [:created_at]
    add_index :billings, [:status]
  end
end
