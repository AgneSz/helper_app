class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :public_transaction_id
      t.integer :account
      t.integer :amount
      t.string :status
      t.integer :settlement_id

      t.timestamps
    end
  end
end
