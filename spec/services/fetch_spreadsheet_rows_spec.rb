require 'rails_helper'

describe FetchSpreadsheetRows do
  describe '.run' do
    it "should fetch and return the current set of rows in the sheet" do
      VCR.use_cassette "fetch_spreadsheet_rows/success" do
        rows = FetchSpreadsheetRows.run

        expect(rows.size).to eq(244)

        expect(rows.first).to include(
          upload_date: Date.strptime("3/30/2016", "%m/%d/%Y"),
          data_manager: "Connie",
          event_url: "NA",
          filename: "VOLREC_NY_cell_2000_people2016-03-30_1.csv",
          group_name: "3/30 - NY Canvass # 1",
          hustlers_needed: 10,
          invitation_start: 7,
          invitation_end: 0,
          notes: "Chyanna working @ 31 N@7:30a  DM @ 8a",
          reminder_start: "Disable",
          reminder_end: "Disable",
          row_color: "#9900ff",
          short_code: "NA",
          supporters: 2000,
        )
      end
    end
  end
end
