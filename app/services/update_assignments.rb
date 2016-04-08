class UpdateAssignments
  def self.run
    new.run
  end

  def run
    UpdateColorCells.run

    FetchSpreadsheetRows.run.each do |row|
      begin
        assignment = Assignment.find_or_initialize_by(filename: row[:filename])
        assignment.attributes = row
        assignment.save!
      rescue
        puts "Got attributes for bad record: #{attributes.inspect}"
        raise
      end
    end

    true
  end
end
