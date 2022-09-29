class CreateBlog
  include Sidekiq::Job
  def perform
    Blog.create(author_name: "Aagney", title: "First Blog", description: "This is my first blog")
  end
end
