require 'spec_helper'

feature "Browsing the home page" do
  let!(:blog_post) { create(:post, :published) }

  scenario "Viewing the root content" do
    visit root_url
    expect(page).to have_content 'Kevin McKelvin'
  end

  scenario "Viewing the blog entries" do
    visit root_url
    expected_content = blog_post.teaser
    expect(expected_content.length).to be > 1
    expect(page).to have_content expected_content
  end
end
