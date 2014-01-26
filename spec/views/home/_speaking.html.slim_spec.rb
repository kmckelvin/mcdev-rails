require 'spec_helper'

describe "home/_speaking.html.slim" do
  context "when there are upcoming presentations" do
    it "renders the upcoming presentations" do
      presentation = build(:presentation, :future)
      presenter = HomePresenter.new([], [], [presentation], [])
      assign(:presenter, presenter)
      render
      expect(rendered).to have_content "Upcoming"
      expect(rendered).to have_content presentation.title
    end
  end

  context "when there are no upcoming presentations" do
    it "doesn't render the upcoming title" do
      presenter = HomePresenter.new([], [], [], [])
      assign(:presenter, presenter)
      render
      expect(rendered).not_to have_content "Upcoming"
    end
  end

  context "when there are past presentations"
  context "when there are no past presentations"

  context "when there are both past and upcoming presentations"
end
