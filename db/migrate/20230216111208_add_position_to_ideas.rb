class AddPositionToIdeas < ActiveRecord::Migration[7.0]
  def change
    add_column :ideas, :position, :integer
  end
end
