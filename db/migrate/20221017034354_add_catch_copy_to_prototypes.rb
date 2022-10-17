class AddCatchCopyToPrototypes < ActiveRecord::Migration[6.0]
  def change
    add_column :prototypes, :catch_copy, :text
  end
end
