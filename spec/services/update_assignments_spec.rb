require 'rails_helper'

describe UpdateAssignments do
  let!(:existing_assignment) do
    Fabricate :assignment,
      filename: "barnstorm_FremontCA_44dz5(234 people)",
      row_color: "#ffffff"
  end

  let(:rows) do
    [
      {
        :upload_date=> Date.parse("Sat, 02 Apr 2016"),
        :group_name=>"4/5 - Fremont, CA - Vol Barnstorm",
        :event_at=>Time.parse("Tue, 05 Apr 2016 18:30:00 +0000"),
        :data_manager=>"vrindadesh",
        :notes=>"Includes Reminders - Use Script and Note in ping",
        :filename=>"barnstorm_FremontCA_44dz5(234 people)",
        :supporters=>234,
        :hustlers_needed=>0,
        :short_code=>"http://bernie.to/fremontvolstorm",
        :event_url=>"https://go.berniesanders.com/page/event/detail/44dz5 ",
        :invitation_start=>7,
        :invitation_end=>0,
        :reminder_start=>"1",
        :reminder_end=>"0",
        :row_color=>"#00ff00"
      },
      {
        :upload_date=>Date.parse("Sat, 02 Apr 2016"),
        :group_name=>"4/5 - Fremont, CA - Vol Barnstorm",
        :event_at=>Time.parse("Tue, 05 Apr 2016 18:30:00 +0000"),
        :data_manager=>"vrindadesh",
        :notes=>"Includes Reminders - Use Script and Note in ping",
        :filename=>"barnstorm_underflow_FremontCA_44dz5(946 people)",
        :supporters=>946,
        :hustlers_needed=>7,
        :short_code=>"http://bernie.to/fremontvolstorm",
        :event_url=>"https://go.berniesanders.com/page/event/detail/44dz5 ",
        :invitation_start=>7,
        :invitation_end=>0,
        :reminder_start=>"1",
        :reminder_end=>"0",
        :row_color=>"#00ff00"
      }
    ]
  end

  describe '.run' do
    before do
      allow(UpdateColorCells).to receive(:run)
      allow(FetchSpreadsheetRows).to receive(:run) { rows }
    end

    it "should update an existing assignment" do
      expect { UpdateAssignments.run }.to change {
        existing_assignment.reload
        existing_assignment.row_color
      }.to "#00ff00"
    end

    it "should only create one new row" do
      expect { UpdateAssignments.run }.to change { Assignment.count }.from(1).to(2)
    end
  end
end
