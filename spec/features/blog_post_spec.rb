require 'spec_helper'

feature "Browsing the public blog" do
  context "with a published post" do
    given(:published_post) { create(:post, :published) }

    scenario "Viewing a published post" do
      visit blog_path published_post.path_params
      expect(page).to have_content published_post.title
      expect(page.body).to include published_post.processed_body
    end
  end
end
