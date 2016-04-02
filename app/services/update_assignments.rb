class UpdateAssignments
  def self.run
    new.run
  end

  def run
    UpdateColorCells.run

    FetchSpreadsheetRows.run.each do |row|
      assignment = Assignment.find_or_initialize_by(filename: row[:filename])
      assignment.attributes = row
      assignment.save!
    end

    true
  end
end
