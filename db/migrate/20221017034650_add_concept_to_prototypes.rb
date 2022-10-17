class AddConceptToPrototypes < ActiveRecord::Migration[6.0]
  def change
    add_column :prototypes, :concept, :text
  end
end
