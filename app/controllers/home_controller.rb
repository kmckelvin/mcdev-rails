class HomeController < ApplicationController

  def index
    query = SummaryQuery.new
    @presenter = HomePresenter.new(query.recent_posts(8),
                                   query.projects,
                                   query.upcoming_presentations,
                                   query.past_presentations)
  end

end
