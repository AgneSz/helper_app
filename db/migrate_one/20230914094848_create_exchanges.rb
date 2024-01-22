class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.integer :public_transaction_id
      t.integer :currency_exchange_rate_id
      t.integer :amount_from
      t.integer :amount_to
      t.integer :commission_amount
      t.string :currency

      t.timestamps
    end
  end
end
