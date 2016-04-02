class ChangeStatusDefault < ActiveRecord::Migration
  def change
    change_column_default :assignments, :status, 'prepping'
  end
end
