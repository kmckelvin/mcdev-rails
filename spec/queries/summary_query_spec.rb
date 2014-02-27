require 'spec_helper'

describe SummaryQuery do
  def query
    SummaryQuery.new
  end

  describe "#recent_posts" do
    it "queries for the n recent posts" do
      posts = Object.new
      expect(Post).to receive(:published) do
        double.tap do |published_post_arel|
          expect(published_post_arel).to receive(:recent).with(5).and_return posts
        end
      end

      results = query.recent_posts(5)

      expect(results).to eq posts
    end
  end

  describe "#projects" do
    it "returns all projects" do
      projects = Object.new
      expect(Project).to receive(:unscoped).and_return projects

      results = query.projects
      expect(results).to eq projects
    end
  end

  describe "#upcoming_presentations" do
    it "returns the future presentations" do
      presentations = Object.new
      expect(Presentation).to receive(:future).and_return presentations

      results = query.upcoming_presentations
      expect(results).to eq presentations
    end
  end

  describe "#past_presentations" do
    it "returns the past presentations" do
      presentations = Object.new
      expect(Presentation).to receive(:past).and_return presentations

      results = query.past_presentations
      expect(results).to eq presentations
    end
  end

end
