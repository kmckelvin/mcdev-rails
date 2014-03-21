require 'spec_helper'

describe PostPresenter do
  let(:blog_post) { build(:post, published_at: "2013-01-02") }
  let(:presenter) { PostPresenter.new(blog_post) }

  describe "#published_at_iso8601" do
    it "returns the ISO8601 formatted publication date" do
      expect(presenter.published_at_iso8601).to eql "2013-01-02"
    end
  end

  describe "#published_at" do
    it "returns a human-friendly formatted date" do
      expect(presenter.published_at).to eql "2 Jan 2013"
    end
  end
end
