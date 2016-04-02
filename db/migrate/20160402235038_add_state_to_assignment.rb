class AddStateToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :state, :string, limit: 2
  end
end
