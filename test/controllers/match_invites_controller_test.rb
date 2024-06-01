require "test_helper"

class MatchInvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get match_invites_create_url
    assert_response :success
  end

  test "should get index" do
    get match_invites_index_url
    assert_response :success
  end
end
