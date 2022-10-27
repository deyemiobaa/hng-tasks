require "test_helper"

class IntrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intro = intros(:one)
  end

  test "should get index" do
    get intros_url, as: :json
    assert_response :success
  end

  test "should create intro" do
    assert_difference("Intro.count") do
      post intros_url, params: { intro: { age: @intro.age, backend: @intro.backend, bio: @intro.bio, slack_username: @intro.slack_username } }, as: :json
    end

    assert_response :created
  end

  test "should show intro" do
    get intro_url(@intro), as: :json
    assert_response :success
  end

  test "should update intro" do
    patch intro_url(@intro), params: { intro: { age: @intro.age, backend: @intro.backend, bio: @intro.bio, slack_username: @intro.slack_username } }, as: :json
    assert_response :success
  end

  test "should destroy intro" do
    assert_difference("Intro.count", -1) do
      delete intro_url(@intro), as: :json
    end

    assert_response :no_content
  end
end
