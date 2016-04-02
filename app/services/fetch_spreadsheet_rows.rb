class FetchSpreadsheetRows
  attr_reader :spreadsheet_key

  def initialize(spreadsheet_key: ENV['SPREADSHEET_KEY'])
    @spreadsheet_key = spreadsheet_key
  end

  def self.run(*args)
    new(*args).run
  end

  def run
    recent_full_row = nil

    rows
      .map do |row|
        if row[1].blank?
          nil
        elsif row[0].blank?
          # "one assignment two files"
          # use the recent_full_row as the main data row, with overrides from
          # additional_row
          row_to_hash(recent_full_row, additional_row: row)
        else
          recent_full_row = row
          row_to_hash(row)
        end
      end
      .compact
  end

  private

  def row_to_hash(row, additional_row: [])
    {
      upload_date: Date.strptime(row[0], "%m/%d/%Y"),
      group_name: row[1],
      event_at: (DateTime.strptime("#{row[2]} #{row[3]}", "%m/%d/%Y %H:%M %P") rescue nil),
      data_manager: row[4],
      notes: row[6],
      filename: (additional_row[7] || row[7]),
      supporters: (additional_row[8] || row[8]).to_i,
      hustlers_needed: (additional_row[9] || row[9]).to_i,
      short_code: row[11],
      event_url: row[12],
      invitation_start: row[13].to_i,
      invitation_end: row[14].to_i,
      reminder_start: row[15],
      reminder_end: row[16],
      row_color: row[35]
    }
  end

  FIRST_ROW = 6

  def rows
    @rows ||= sheet.rows[FIRST_ROW..-1]
  end

  def sheet
    @sheet ||= document.worksheets[0]
  end

  def document
    @document ||= session.spreadsheet_by_key(ENV.fetch('SPREADSHEET_KEY'))
  end

  def session
    GdriveSession.instance
  end
end
