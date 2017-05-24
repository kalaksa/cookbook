class ChangeTaggingsColumnNameFromArticleToRecipe < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :taggings, :article_id, :recipe_id
  end

  def self.down
    rename_column :taggings, :recipe_id, :article_id
  end
end
