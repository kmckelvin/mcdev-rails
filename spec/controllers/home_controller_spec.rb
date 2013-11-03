require 'spec_helper'

describe HomeController do
  render_views
  let(:blog_post) { create(:post, :published) }
  describe "GET index" do
    context "with unpublished posts" do
      let!(:unpublished_post) { create(:post) }
      it "only renders published posts" do
        blog_post
        get :index

        expect(response.code).to eq "200"
        expect(assigns(:presenter).posts).to eq [blog_post]
      end
    end
  end
end
