class HomeController < ApplicationController

  def index
    posts = Post.published.recent(8)
    @presenter = HomePresenter.new(posts)
  end

end
