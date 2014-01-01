class HomePresenter
  def initialize(posts, projects)
    @posts = posts
    @projects = projects
  end

  attr_reader :posts, :projects
end
