require 'spec_helper'

describe Presentation do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:presented_on) }

  describe "scopes" do
    describe ".past" do
      let!(:visible) { create(:presentation, :past) }
      let!(:invisible) { create(:presentation, presented_on: Date.current) }
      it "returns past presentations" do
        expect(Presentation.past).to eq [visible]
      end
    end

    describe ".future" do
      let!(:visible) { create(:presentation, presented_on: Date.current) }
      let!(:invisible) { create(:presentation, :past) }

      it "returns future presentations" do
        expect(Presentation.future).to eq [visible]
      end
    end
  end
end
