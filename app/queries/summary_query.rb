class SummaryQuery
  def past_presentations
    Presentation.past
  end

  def projects
    Project.unscoped
  end

  def recent_posts(limit)
    Post.published.recent(limit)
  end

  def upcoming_presentations
    Presentation.future
  end
end
