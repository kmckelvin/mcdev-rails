class Post < ActiveRecord::Base
  before_save :compile_markdown

  def self.recent(limit)
    order("#{table_name}.published_at desc, #{table_name}.created_at desc").limit(limit)
  end

  TEASER_LENGTH = 50
  def teaser
    words = body[0..500].split(' ', TEASER_LENGTH + 1)
    words.pop
    teaser = words.join(' ')
    ellip = words.count == TEASER_LENGTH ? "..." : ""
    teaser + ellip
  end

  def longer_than_teaser?
    body.split.size > TEASER_LENGTH
  end

  private
  def compile_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    self.processed_content = markdown.render(body)
  end
end
