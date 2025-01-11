class BlogController < ApplicationController
  def index
    # Since it's static, we'll hardcode the blog posts data
    @posts = [
      {
        title: "My First Blog Post",
        date: "2023-07-20",
        preview: "This is my first blog post about...",
        slug: "my-first-blog-post"
      }
      # Add more posts here as needed
    ]
  end

  def show
    # In a static site, we'll handle individual posts with static templates
    @post_slug = params[:slug]
    render "blog/posts/#{@post_slug}"
  rescue ActionView::MissingTemplate
    redirect_to blog_path, alert: "Post not found"
  end
end
