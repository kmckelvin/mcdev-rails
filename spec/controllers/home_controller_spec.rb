require 'spec_helper'

describe HomeController do
  render_views
  describe "GET index" do
    before do
      get :index
    end

    subject { response }

    its(:code) { should == "200" }
  end
end
