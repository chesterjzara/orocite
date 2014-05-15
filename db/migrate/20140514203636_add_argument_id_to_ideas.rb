class AddArgumentIdToIdeas < ActiveRecord::Migration
  
  def change
    add_column :ideas, :argument_id, :integer
    add_index :ideas, :argument_id
  end

end
