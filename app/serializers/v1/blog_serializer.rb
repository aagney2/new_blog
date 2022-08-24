module V1
  class BlogSerializer < ActiveModel::Serializer
    attributes :id, :author_name, :title, :display_comments
    if instance_options[:comments] == true
      has_many :comments
    end

    def display_comments
      instance_options[:comments]
    end
  end
end
