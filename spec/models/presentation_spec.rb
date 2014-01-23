require 'spec_helper'

describe Presentation do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:presented_on) }

  describe "scopes" do
    describe ".past" do
      let!(:visible) { create(:presentation, :past) }
      let!(:visible_first) { create(:presentation, presented_on: visible.presented_on + 1.day) }
      let!(:invisible) { create(:presentation, presented_on: Date.current) }
      it "returns past presentations in chronological order" do
        expect(Presentation.past).to eq [visible_first, visible]
      end
    end

    describe ".future" do
      let!(:visible) { create(:presentation, presented_on: Date.current) }
      let!(:visible_last) { create(:presentation, presented_on: Date.current + 1.day) }
      let!(:invisible) { create(:presentation, :past) }

      it "returns future presentations" do
        expect(Presentation.future).to eq [visible, visible_last]
      end
    end
  end
end
