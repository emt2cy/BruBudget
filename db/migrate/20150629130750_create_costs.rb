class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :iteam
      t.float :cost

      t.timestamps null: false
    end
  end
end
