require 'spec_helper'

describe "blog/show.html.slim" do
  context "with a published post" do
    it "sets the title" do
      blog_post = build(:post, :published)
      presenter = PostPresenter.new(blog_post)
      assign(:post, presenter)

      render

      expect(view.content_for(:page_title)).to eq blog_post.title
    end

    it "renders the post's processed_body" do
      blog_post = build(:post, :published, processed_body: "<h1>The body</h1>")
      presenter = PostPresenter.new(blog_post)
      assign(:post, presenter)

      render

      expect(rendered).to include blog_post.processed_body
    end
  end
end
