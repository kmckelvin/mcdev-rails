class HomeController < ApplicationController

  def index
    posts = Post.published.recent(8)
    projects = Project.unscoped
    @presenter = HomePresenter.new(posts, projects)
  end

end
