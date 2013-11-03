class HomeController < ApplicationController

  def index
    posts = Post.recent(8)
    @presenter = HomePresenter.new(posts)
  end

end
