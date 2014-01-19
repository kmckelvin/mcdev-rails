class Post < ActiveRecord::Base
  before_save :compile_markdown
  before_save :generate_slug, if: -> { slug.blank? }

  scope :published, -> { where(published: true).where.not(published_at: nil, slug: nil) }
  scope :recent, ->(limit) { order("#{table_name}.published_at desc, #{table_name}.created_at desc").limit(limit) }
  scope :by_publication_date, -> { published.order(published_at: :desc) }

  def path_params
    {
      year: published_at.year.to_s,
      month: published_at.month.to_s.rjust(2, "0"),
      slug: slug
    }
  end

  private
  def compile_markdown
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    markdown = Redcarpet::Markdown.new(renderer, options)
    self.processed_body = markdown.render(body)
  end

  def generate_slug
    self.slug = SlugGenerator.new.generate(title)
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end
end
