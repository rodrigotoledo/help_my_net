require 'rails_helper'

describe 'Signing in with correct credentials' do
  before do
    visit new_user_session_url
  end
  it "should have success access" do
    create_user_and_log_in
    expect(page).to have_current_path(root_path)
  end

  it 'should have failure to access' do
    fill_in 'Email', with: 'wrong'
    fill_in 'Password', with: 'wrong'
    click_button 'Log in'
    expect(page).to have_current_path(new_user_session_path)
  end
end