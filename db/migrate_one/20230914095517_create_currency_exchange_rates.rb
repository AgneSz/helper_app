class CreateCurrencyExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :currency_exchange_rates do |t|
      t.string :currency_from
      t.string :currency_to
      t.decimal :exchange_rate

      t.timestamps
    end
  end
end
