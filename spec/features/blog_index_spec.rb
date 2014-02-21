require 'spec_helper'

feature "Browsing the blog index" do
  it "doesn't list unpublished posts" do
    blog_post = create(:post)
    visit blogs_url
    expect(page).not_to have_content blog_post.title
  end

  it "lists all posts by title in chronologically descending order" do
    first_post = create(:post, :published, published_at: 2.days.ago)
    second_post = create(:post, :published, published_at: 1.day.ago)

    visit blogs_url
    expect(page.body).to be =~ /#{second_post.title}.*#{first_post.title}/
  end
end
