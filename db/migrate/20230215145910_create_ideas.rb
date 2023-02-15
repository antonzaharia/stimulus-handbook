class CreateIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas do |t|
      t.string :body
      t.belongs_to :tweet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
