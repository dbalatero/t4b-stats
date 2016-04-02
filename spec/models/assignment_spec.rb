require 'rails_helper'

describe Assignment do
  describe 'inferring state' do
    it "should infer state from group_name" do
      subject.group_name = "3/30 - CA Phonebank # 10"

      expect {
        subject.valid?
      }.to change { subject.state }.to("CA")
    end
  end

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
