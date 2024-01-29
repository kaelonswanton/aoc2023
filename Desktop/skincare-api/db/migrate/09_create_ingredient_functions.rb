class CreateIngredientFunctions < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredient_functions do |t|
      t.references :ingredient, foreign_key: true
      t.references :function, foreign_key: true

      t.timestamps
    end
  end
end
