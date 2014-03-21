class PostPresenter < SimpleDelegator
  def published_at
    super.strftime("%e %b %Y").strip
  end

  def published_at_iso8601
    __getobj__.published_at.strftime("%Y-%m-%d")
  end
end
