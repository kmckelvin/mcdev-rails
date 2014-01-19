require 'spec_helper'

describe HomePresenter do
  let(:blog_post) { double }
  let(:project) { double }
  let(:presentation) { double }
  let(:past_presentation) { double }

  let(:presenter) { HomePresenter.new([blog_post], [project], [presentation], [past_presentation]) }

  describe "#posts" do
    it "returns the posts" do
      expect(presenter.posts).to eq [blog_post]
    end
  end

  describe "#projects" do
    it "returns the projects" do
      expect(presenter.projects).to eq [project]
    end
  end

  describe "#upcoming_presentations" do
    it "returns the upcoming presentation" do
      expect(presenter.upcoming_presentations).to eq [presentation]
    end
  end

  describe "#past_presentations" do
    it "returns the past presentation" do
      expect(presenter.past_presentations).to eq [past_presentation]
    end
  end
end
