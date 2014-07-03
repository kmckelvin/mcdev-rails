# configuration options for feed
feed_options = {
  # set feed language, default is 'en-US'
  language: 'en-US',

  #set url for feed, default to current URL
  url: 'http://kmckelvin.com'
}

# github.com/rails/rails/blob/master/
#   actionpack/lib/action_view/helpers/atom_feed_helper.rb#L96
atom_feed feed_options do |feed|
  # set feed title
  feed.title "McDev"

  # set feed updated date, setting published_at of the newest post
  if @posts.any?
    feed.updated @posts.first.published_at
  end

  @posts.each do |post|
    # configuration options for feed entry
    feed_entry_options = {
      # set entry published date, otherwise will be by default created_at
      published: post.published_at,
      # set entry updated date, otherwise will be by default updated_at
      updated:   post.published_at,
      url:       blog_url(post.path_params)
    }

    # github.com/rails/rails/blob/master/
    #   actionpack/lib/action_view/helpers/atom_feed_helper.rb#L180
    feed.entry post, feed_entry_options do |entry|
      # set entry title, to use html add type: 'html' (default: 'text')
      entry.title post.title

      # to display some HTML in entry
      entry.content post.processed_body, type: 'html'

      # to display image for entry, we got some thumb image in post
      #entry.content image_tag(post.image.url(:thumb)), type: 'html'

      # set entry author
      entry.author do |author|
        author.name "Kevin McKelvin"
      end

      # URL for entry, defaults to the URL for the record
      entry.url blog_url(post.path_params)

      # set entry summary, for example first 100 characters of post
      entry.summary post.teaser
    end
  end
end
