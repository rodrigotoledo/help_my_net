module SigninHelper
  def create_user_and_log_in
    logged_user = create(:user)
    visit new_user_session_path
    fill_in :user_email, with: logged_user.email
    fill_in :user_password, with: logged_user.password
    click_on 'Log in'
  end
end