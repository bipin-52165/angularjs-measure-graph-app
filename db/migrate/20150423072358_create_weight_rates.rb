class CreateWeightRates < ActiveRecord::Migration
  def change
    create_table :weight_rates do |t|
      t.integer :rate

      t.timestamps null: false
    end
  end
end
