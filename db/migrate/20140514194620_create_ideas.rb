class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :content
      t.string :proof
      t.integer :user_id

      t.timestamps
    end
    add_index :ideas, [:user_id, :created_at]
    add_index :ideas, [:argument_id, :created_at]
  end
end
