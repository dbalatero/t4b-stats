class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.date :upload_date
      t.string :filename
      t.string :group_name
      t.string :data_manager
      t.datetime :event_at
      t.text :notes
      t.integer :supporters
      t.integer :hustlers_needed
      t.string :short_code
      t.string :event_url
      t.integer :invitation_start
      t.integer :invitation_end
      t.string :reminder_start
      t.string :reminder_end
      t.string :row_color

      t.string :status
      t.datetime :ready_for_upload_at
      t.datetime :ready_for_hustling_at
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
