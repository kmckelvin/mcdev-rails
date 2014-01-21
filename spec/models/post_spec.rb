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
      post = build(:post)

      post.body = <<EOS
``` ruby
puts "Hello World"
```
EOS

      post.save
      expect(post.processed_body).to include '<span class="s2">'
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
end
