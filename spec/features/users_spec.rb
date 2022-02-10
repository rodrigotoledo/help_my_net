require 'rails_helper'

describe 'Companies operations with sign in user' do
  before do
    create_user_and_log_in
    @company = create(:company, name: "faker")
  end

  describe 'listing' do
    it "should have element listing" do
      click_link 'Companies'
      expect(page).to have_content("faker")
    end
  end

  describe 'create and update' do
    before do
      click_link 'Companies'
    end

    it 'should create a Company' do
      fill_in 'Name', with: 'New Company'
      click_on 'Create Company'
      expect(page).to have_content("New Company")
    end

    it 'should edit a Company' do
      find("a[href='#{edit_company_path(@company.id)}']").click
      fill_in 'Name', with: 'New Updated company'
      click_on 'Update Company'
      expect(page).to have_content("New Updated company")
    end

    it 'should not create a Company' do
      fill_in 'Name', with: ''
      click_on 'Create Company'
      expect(page).to have_content("Name can't be blank")
    end

    it 'should not create a Company' do
      fill_in 'Name', with: ''
      click_on 'Create Company'
      expect(page).to have_content("Name can't be blank")
    end

    it 'should destroy company' do
      expect(page).to have_content("faker")
      click_on "Destroy: faker"
      expect(page).to have_no_content("faker")
    end
  end
end