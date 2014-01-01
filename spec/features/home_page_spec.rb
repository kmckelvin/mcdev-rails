require 'spec_helper'

feature "Browsing the home page" do
  given!(:blog_post) { create(:post, :published) }

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

  context "projects" do
    given!(:project) { create(:project) }

    scenario "Viewing the list of projects" do
      visit root_url
      expect(page).to have_content project.title
      expect(page).to have_content project.language
      expect(page).to have_content project.description

      click_on project.title
      expect(current_url).to eq project.github_url
    end
  end
end
