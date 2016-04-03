class AddUploadDateIndex < ActiveRecord::Migration
  def change
    add_index :assignments, :upload_date
  end
end
