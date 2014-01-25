require 'spec_helper'

describe ApplicationHelper do
  describe "#page_title" do
    it "returns the title as 'the page title | app name'" do
      helper.content_for(:page_title, "the page title")
      title = helper.page_title(app_name: "app name", separator: " | ")
      expect(title).to eq "the page title | app name"
    end
  end
end
