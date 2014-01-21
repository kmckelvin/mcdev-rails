require 'spec_helper'

describe BlogController do
  def create_post
    create(:post, :published)
  end

  describe "GET show" do
    describe "with a valid post" do
      it "shows the post" do
        post = create_post
        get :show, post.path_params

        expect(assigns[:post]).to eq post
      end
    end
  end
end
