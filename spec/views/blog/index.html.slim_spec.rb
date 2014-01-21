require 'spec_helper'

describe "blog/index.html.slim" do
  def create_posts_array(posts)
    Kaminari.paginate_array(posts).page(1)
  end

  context "when there are posts to show" do
    it "renders the posts" do
      blog_post = build(:post, :published)
      posts = create_posts_array([blog_post])
      assign(:posts, posts)

      render

      expect(rendered).to have_link blog_post.title, href: blog_path(blog_post.path_params)
    end
  end

  context "when there are no posts to show" do
    it "renders a message stating that there are 'No posts'" do
      posts = create_posts_array([])
      assign(:posts, posts)

      render

      expect(rendered).to have_content "There are no posts to display."
    end
  end
end
