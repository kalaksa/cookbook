require_relative '20170525203940_add_paperclip_field_to_recipe'

class RemovePaperclipFieldFromRecipe < ActiveRecord::Migration[5.0]
  def change
    revert AddPaperclipFieldToRecipe
  end
end
