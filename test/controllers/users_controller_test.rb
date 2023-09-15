require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_url
    assert_response :success
  end
  
  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { username: 'test', email: 'test@example.com', password: 'password1' } }
    end
    assert_redirected_to root_path
    
    # Debugging: Uncomment this to print the last User's errors
    # puts User.last.errors.full_messages
  end
end
