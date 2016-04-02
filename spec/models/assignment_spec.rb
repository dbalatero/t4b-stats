require 'rails_helper'

describe Assignment do
  describe 'updating row color' do
    let!(:assignment) do
      Fabricate :assignment, row_color: "#ffffff"
    end

    it "should update the status when the row_color changes" do
      expect {
        assignment.attributes = { row_color: "#00ff00" }
      }.to change { assignment.status }.to("ready_for_hustling")
    end

    it "should update the ready_for_hustling_at time" do
      expect {
        assignment.attributes = { row_color: "#00ff00" }
      }.to change { assignment.ready_for_hustling_at }
    end

    it "should update the ready_for_upload_at time" do
      expect {
        assignment.attributes = { row_color: "#ffff00" }
      }.to change { assignment.ready_for_upload_at }
    end

    it "should update the completed_at time" do
      expect {
        assignment.attributes = { row_color: "#9900ff" }
      }.to change { assignment.completed_at }
    end
  end
end
