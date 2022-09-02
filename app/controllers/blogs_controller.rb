class BlogsController < ApplicationController
  # Controller Filters ->
  # Filters are methods that are run "before", "after" or "around" a controller action.
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  after_action :print

  # adding a custom method.
  # Serialzer
  # Specs
  def list_all_blogs_comments
  end

  def index
    @blogs = Blog.all
    # Serialzer
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "Article was successfully created"
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def show
    @comments = @blog.comments
    render json: {data: ActiveModelSerializers::SerializableResource.new(@blog, serializer:BlogSerializer)}
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to blog_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  def user_stats
    @stats_hash = Blog.group(:author_name).count
  end

  private
  def blog_params
    params.require(:blog).permit(:author_name, :title, :description)
  end

  def set_blog
    puts "I have been invoked in set_blog method"
    @blog = Blog.find(params[:id])
  end

  def print
    puts "I have been invoked in print method"
  end
end
