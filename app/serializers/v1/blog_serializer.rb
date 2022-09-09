module V1
  class BlogSerializer < ActiveModel::Serializer
    attributes :id, :author_name, :title, :comments, :description
    # if instance_options[:comments] == true
    #   has_many :comments
    # end

    def comments
      # instance_options[:comments]
      object.comments if instance_options[:comments]
    end
  end
end
