class HomeController < ApplicationController

  def index
    posts = Post.published.recent(8)
    projects = Project.unscoped
    upcoming_presentations = Presentation.future
    past_presentations = Presentation.past
    @presenter = HomePresenter.new(posts, projects, upcoming_presentations, past_presentations)
  end

end
