require 'spec_helper'

describe HomePresenter do
  let(:blog_post) { stub }
  let(:project) { stub }

  let(:presenter) { HomePresenter.new([blog_post], [project]) }

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
end
