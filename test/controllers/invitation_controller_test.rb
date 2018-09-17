require 'test_helper'

class InvitationControllerTest < ActionDispatch::IntegrationTest
  test "should get sender_id:integar" do
    get invitation_sender_id:integar_url
    assert_response :success
  end

  test "should get recipient_email:string" do
    get invitation_recipient_email:string_url
    assert_response :success
  end

end
