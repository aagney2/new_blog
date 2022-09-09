require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index without blog data' do
     get api_v1_blogs_path
     assert_response :success
   end

  test 'should get index' do
    Blog.create(author_name: 'Abc', title: 'xyz', description: 'pqr')
    get api_v1_blogs_path
    res = JSON.parse(response.body)
    assert_equal(res["data"][0].keys, ["id", "author_name", "title", "comments", "description"])
    assert_response :success
  end

  test 'should get index with pagination' do
    get api_v1_blogs_path(page: 2)
    assert_response :success
  end
end
