require 'spec_helper'

describe "application/_google_analytics.html.erb" do
  context "when running in production" do
    it "renders the analytics script" do
      Rails.env.stub(production?: true)
      render
      expect(rendered).to have_content "script"
    end
  end

  context "when running in development" do
    it "doesn't render the script" do
      Rails.env.stub(production?: false)
      render
      expect(rendered).not_to have_content "script"
    end
  end
end
