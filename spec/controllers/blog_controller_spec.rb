require 'spec_helper'

describe BlogController do
  # slugs
  # /blog/2013/07/clojure-post => show
  # /blog/2013/07 => index
  # /blog/2013 => index
  # /blog => index
  #
  def create_post
    create(:post, :published)
  end

  describe "GET show" do
    describe "with a valid post" do
      it "shows the post" do
        post = create_post
        get :show, slug: post.slug, year: '2013', month: '07'

        expect(assigns[:post]).to eq post
      end
    end
  end
end
