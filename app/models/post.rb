class Post < ActiveRecord::Base
  before_save :compile_markdown
  before_save :generate_slug, if: -> { slug.blank? }

  scope :published, -> { where(published: true).where.not(published_at: nil, slug: nil) }
  scope :recent, ->(limit) { order("#{table_name}.published_at desc, #{table_name}.created_at desc").limit(limit) }

  def path_params
    {
      year: published_at.year.to_s,
      month: published_at.month.to_s.rjust(2, "0"),
      slug: slug
    }
  end

  private
  def compile_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    self.processed_body = markdown.render(body)
  end

  def generate_slug
    self.slug = SlugGenerator.new.generate(title)
  end
end
