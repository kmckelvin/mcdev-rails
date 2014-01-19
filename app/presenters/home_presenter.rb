class HomePresenter
  def initialize(posts, projects, upcoming_presentations, past_presentations)
    @posts = posts
    @projects = projects
    @upcoming_presentations = upcoming_presentations
    @past_presentations = past_presentations
  end

  attr_reader :posts, :projects, :upcoming_presentations, :past_presentations
end
