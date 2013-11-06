class BlogController < ApplicationController
  def show
    @post = post
  end

  private
  def post
    Post.find_by_slug!(params[:slug])
  end
end
