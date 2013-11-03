require 'spec_helper'

describe Post do
  describe "scopes" do
    describe ".published" do
      it "only returns posts with all publication data" do
        visible_post = create(:post, :published)
        create(:post) # invisible post

        expect(Post.published.to_a).to eq [visible_post]
      end
    end

    describe ".recent" do
      it "returns the last specified posts" do
        create(:post)
        visible_post = create(:post)
        expect(Post.recent(1).to_a).to eq [visible_post]
      end
    end
  end

  describe "#processed_body" do
    it "is created from the markup after save" do
      post = build(:post)
      expect {
        post.save
      }.to change { post.processed_body }
    end
  end
end
