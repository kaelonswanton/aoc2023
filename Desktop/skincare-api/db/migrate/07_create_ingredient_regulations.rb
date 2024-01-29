class CreateIngredientRegulations < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredient_regulations do |t|
      t.references :ingredient, foreign_key: true
      t.references :regulation, foreign_key: true

      t.timestamps
    end
  end
end
