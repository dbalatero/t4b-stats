require 'rails_helper'

describe UpdateColorCells do
  describe '.run' do
    it "should update the color cells on the spreadsheet correctly" do
      allow(ENV).to receive(:fetch)
        .with('COLOR_SCRIPT_KEY')
        .and_return("COLOR_SCRIPT_KEY")

      VCR.use_cassette "update_color_cells/success" do
        expect(UpdateColorCells.run).to eq(true)
      end
    end
  end
end
