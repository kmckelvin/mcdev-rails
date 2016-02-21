require 'spec_helper'

describe Post do
  describe "scopes" do
    describe ".published" do
      it "only returns posts with all publication data" do
        visible_post = create(:post, :published)
        create(:post) # invisible post

        expect(visible_post.slug).not_to be_blank
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

    it "highlights code blocks in markdown" do
      post = build(:post, body: 'POST BODY')

      expect_any_instance_of(MarkdownWithPygmentsCompiler).
        to receive(:compile).with(post.body).and_return('RESULT BODY')
      post.save

      expect(post.processed_body).to eq 'RESULT BODY'
    end
  end

  describe "#slug" do
    it "is created from the title after save" do
      post = build(:post, title: "Lazy Enumeration in Ruby 1.9", slug: nil)
      expect {
        post.save
      }.to change { post.slug }.to "lazy-enumeration-in-ruby-1-dot-9"
    end
  end

  describe "#path_params" do
    it "returns the year, month and slug" do
      post = build(:post, :published)
      expect(post.path_params).to eq(year: "2013", month: "08", slug: post.slug)
    end
  end

  describe "#older_post" do
    context "when there are no older published posts" do
      it "returns nil" do
        post = create(:post, :published)
        unpublished_post = create(:post, published: false, published_at: post.published_at - 1.day)
        expect(post.older_post).to be_nil
      end
    end

    context "when there are older published posts" do
      it "returns the next chronological post" do
        post = create(:post, :published)
        published_post1 = create(:post, published: true, published_at: post.published_at - 1.day)
        published_post2 = create(:post, published: true, published_at: post.published_at - 2.days)

        expect(post.older_post).to eq published_post1
        expect(published_post1.older_post).to eq published_post2
      end
    end
  end

  describe "#newer_post" do
    context "when there are no newer published posts" do
      it "returns nil" do
        post = create(:post, :published)
        unpublished_post = create(:post, published: false, published_at: post.published_at + 1.day)
        expect(post.newer_post).to be_nil
      end
    end

    context "when there are newer published posts" do
      it "returns the previous chronological post" do
        post = create(:post, :published)
        published_post1 = create(:post, published: true, published_at: post.published_at + 1.day)
        published_post2 = create(:post, published: true, published_at: post.published_at + 2.days)

        expect(post.newer_post).to eq published_post1
        expect(published_post1.newer_post).to eq published_post2
      end
    end
  end
end
