class Post < ActiveRecord::Base
  before_save :compile_markdown

  scope :published, -> { where(published: true).where("#{table_name}.published_at is not null") }
  scope :recent, ->(limit) { order("#{table_name}.published_at desc, #{table_name}.created_at desc").limit(limit) }

  private
  def compile_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    self.processed_body = markdown.render(body)
  end
end
