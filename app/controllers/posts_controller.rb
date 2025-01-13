class PostsController < ApplicationController
  def index
    # Since it's static, we'll hardcode the posts data
    @posts = [
      {
        title: "My First Post",
        date: "2023-07-20",
        preview: "This is my first post about...",
        slug: "my-first-post"
      }
      # Add more posts here as needed
    ]
  end

  def show
    # In a static site, we'll handle individual posts with static templates
    @post_slug = params[:slug]
    render "posts/_posts/#{@post_slug}"
  rescue ActionView::MissingTemplate
    redirect_to posts_path, alert: "Post not found"
  end
end
