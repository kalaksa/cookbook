class AddComponentsFieldToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :components, :text
  end
end
