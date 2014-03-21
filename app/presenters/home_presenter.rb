class HomePresenter
  def initialize(posts, projects, upcoming_presentations, past_presentations)
    @posts = posts
    @projects = projects
    @upcoming_presentations = upcoming_presentations
    @past_presentations = past_presentations
  end

  attr_reader :projects, :upcoming_presentations, :past_presentations

  def posts
    @_post_presenters ||= @posts.map { |p| PostPresenter.new(p) }
  end
end
