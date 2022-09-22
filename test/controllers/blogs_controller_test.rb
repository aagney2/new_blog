require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test '#index should get index without blog data' do
     get api_v1_blogs_path
     assert_response :success
   end

  test '#index should get index' do
    create(:blog, title: 'random_blog')
    get api_v1_blogs_path
    res = JSON.parse(response.body)
    assert_equal(res["data"][0].keys, ["id", "author_name", "title", "comments", "description"])
    assert_response :success
  end

  test '#index should get index with pagination' do
    get api_v1_blogs_path(page: 2)
    assert_response :success
  end

  test '#create should create blog' do
    params =
    {
      "blog":{"author_name": "Aagney", "title": "First blog", "description": "This is my first blog"}
    }
    assert_difference("Blog.count", 1) do
      post api_v1_blogs_path(params:params)
    end
    assert_response :created
  end

  test '#create should return unprocessable entity status and error message' do
    params =
    {
      "blog":{"author_name": "", "title": "", "description": ""}
    }
    assert_difference("Blog.count", 0) do
      post api_v1_blogs_path(params:params)
    end
    assert_response :unprocessable_entity
    assert_equal(JSON.parse(response.body)["errors"], ["Title can't be blank", "Author name can't be blank", "Description can't be blank"])
  end

  test '#show should return blog information' do
    blog = create(:blog)
    get api_v1_blog_path(id: blog.id)
    assert_response :success
    res = JSON.parse(response.body)
    # assert_equal(res["data"].keys, ["id", "author_name", "title", "comments", "description"])
    assert_equal(res["data"], {"id" => blog.id, "author_name" => blog.author_name, "title" => blog.title, "comments" => [], "description" => blog.description})
  end

  test '#update should return ok status' do
    blog = create(:blog)
    params =
    {
      "blog":{"description": "This is my first blog"}
    }
    put api_v1_blog_path(params:params, id: blog.id)
    assert_response :ok
  end

  test '#update should return unprocessable entity status and error message' do
    blog = create(:blog)
    params =
    {
      "blog":{"description": ""}
    }
    put api_v1_blog_path(params:params, id: blog.id)
    assert_response :unprocessable_entity
  end

  test '#destroy should return ok status' do
    blog = create(:blog)
    delete api_v1_blog_path(id: blog.id)
    assert_response :ok
  end
end
