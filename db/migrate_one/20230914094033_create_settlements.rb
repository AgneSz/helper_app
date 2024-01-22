class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.integer :account_id
      t.integer :balance

      t.timestamps
    end
  end
end
