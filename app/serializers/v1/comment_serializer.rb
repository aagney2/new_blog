module V1
  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :description, :created_at, :comment_updated
    belongs_to :blog
    def created_at
      object.created_at.strftime('%b %dth %Y')
    end
  end
end 
