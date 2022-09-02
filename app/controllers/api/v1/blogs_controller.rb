module Api
  module V1
    class BlogsController < Api::ApiController
      before_action :set_blog, only: [:show, :update, :destroy]
      after_action :print
      skip_before_action :verify_authenticity_token

      # adding a custom method.
      # Serialzer
      # Specs

      def index
        @blogs = Blog.order(id: :asc).page(params[:page] || 1)
        render json: {data: ActiveModelSerializers::SerializableResource.new(@blogs, each_serializer: ::V1::BlogSerializer, comments: false),
           meta: pagination(@blogs)}
        # Serialzer
      end

      def create
        @blog = Blog.new(blog_params)
        if @blog.save
          render json: {}, status: :created
        else
          render json: {errors: @blog.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def show
        # @comments = @blog.comments
        render json: {data: ActiveModelSerializers::SerializableResource.new(@blog, serializer: ::V1::BlogSerializer, comments: true)}
      end

      def update
        if @blog.update(blog_params)
          render json: {}, status: :ok
        else
          render json: {errors: @blog.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def destroy
        @blog.destroy
        render json: {}, status: :ok
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
  end
end
