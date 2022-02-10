require 'rails_helper'

describe 'Employees operations with sign in user' do
  before do
    create_user_and_log_in
    @employee = create(:employee, name: "faker")
  end

  describe 'listing' do
    it "should have element listing" do
      click_link 'Employees'
      expect(page).to have_content("faker")
    end
  end

  describe 'create and update' do
    before do
      click_link 'Employees'
    end

    it 'should create a employee' do
      fill_in 'Name', with: 'New employee created'
      fill_in 'Document', with: Faker::CPF.numeric
      fill_in 'Email', with: 'new_employee_created@test.com'
      fill_in 'Password', with: 'aassdd'
      fill_in 'Password confirmation', with: 'aassdd'
      fill_in 'Address', with: 'Belo Horizonte - MG'
      click_on 'Create Employee'
      expect(page).to have_content("Employee was successfully created.")
    end

    it 'should edit a employee' do
      find("a[href='#{edit_employee_path(@employee.id)}']").click
      fill_in 'Name', with: 'New Updated employee'
      fill_in 'Password', with: 'aassdd'
      fill_in 'Password confirmation', with: 'aassdd'
      click_on 'Update Employee'
      expect(page).to have_content("New Updated employee")
    end

    it 'should not create a employee' do
      fill_in 'Name', with: ''
      click_on 'Create Employee'
      expect(page).to have_content("Name can't be blank")
    end

    it 'should not create a employee' do
      fill_in 'Name', with: ''
      click_on 'Create Employee'
      expect(page).to have_content("Name can't be blank")
    end

    it 'should destroy employee' do
      expect(page).to have_content("faker")
      click_on "Destroy: faker"
      expect(page).to have_no_content("faker")
    end
  end
end