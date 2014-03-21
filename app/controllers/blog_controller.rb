class BlogController < ApplicationController
  def index
    @posts = Post.by_publication_date.page(params[:page]).per(10)
  end

  def show
    @post = PostPresenter.new(post)
  end

  private
  def post
    Post.find_by_slug!(params[:slug])
  end
end
