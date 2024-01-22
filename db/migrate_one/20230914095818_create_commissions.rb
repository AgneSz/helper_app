class CreateCommissions < ActiveRecord::Migration[7.0]
  def change
    create_table :commissions do |t|
      t.string :currency_from
      t.string :currency_to
      t.integer :commission_percentage

      t.timestamps
    end
  end
end
