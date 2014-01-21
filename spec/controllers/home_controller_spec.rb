require 'spec_helper'

describe HomeController do
  describe "GET index" do
    context "with unpublished posts" do
      let!(:blog_post) { create(:post, :published) }
      let!(:unpublished_post) { create(:post) }
      it "only renders published posts" do
        get :index

        expect(response.code).to eq "200"
        expect(assigns(:presenter).posts).to eq [blog_post]
      end
    end

    context "with a project" do
      let!(:project) { create(:project) }
      it "renders the project" do
        get :index

        expect(assigns(:presenter).projects).to eq [project]
      end
    end

    context "with presentations" do
      let!(:presentation) { create(:presentation, :future) }
      let!(:past_presentation) { create(:presentation, :past) }

      it "assigns the upcoming presentation" do
        get :index

        expect(assigns(:presenter).upcoming_presentations).to eq [presentation]
        expect(assigns(:presenter).past_presentations).to eq [past_presentation]
      end
    end
  end
end
