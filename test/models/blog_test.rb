require "test_helper"

class BlogTest < ActiveSupport::TestCase
  test 'it should have a has_many association with comments' do
      association = Blog.reflect_on_association(:comments)
      assert_equal association.macro, :has_many
  end

  test 'invalid without title' do
    blog = build(:blog, title: "")
    blog.save
    assert_equal blog.errors[:title], ["can't be blank"]
  end

  test 'invalid without author name' do
    blog = build(:blog, author_name: "")
    blog.save
    assert_equal blog.errors[:author_name], ["can't be blank"]
  end

  test 'invalid without description' do
    blog = build(:blog, description: "")
    blog.save
    assert_equal blog.errors[:description], ["can't be blank"]
  end

  test 'valid blog' do
    blog = build(:blog)
    assert blog.valid?
  end
end
