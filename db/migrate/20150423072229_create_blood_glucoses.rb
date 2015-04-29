class CreateBloodGlucoses < ActiveRecord::Migration
  def change
    create_table :blood_glucoses do |t|
      t.integer :glucose

      t.timestamps null: false
    end
  end
end
