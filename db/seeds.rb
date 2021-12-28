# frozen_string_literal: true

user = User.new(email: 'test@test.com', username: 'test@test.com', password: 'aassdd', password_confirmation: 'aassdd',
                first_name: 'Rodrigo', last_name: 'Toledo', is_admin: true)
# user.skip_confirmation!
user.save


author = User.new(email: 'faker@test.com', username: 'faker@test.com', password: 'aassdd', password_confirmation: 'aassdd',
                first_name: 'Author', last_name: 'Faker')
# author.skip_confirmation!
author.save

2.times do
  category = Category.create!(title: Faker::Job.title)
  10.times do
    task = category.tasks.build(title: Faker::Job.title, description: Faker::Lorem.paragraph, address: Faker::Address.full_address, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, author: author, user: user)
    2.times do
      employee = Employee.new(name: Faker::Name.female_first_name, email: Faker::Internet.email, address: Faker::Address.full_address, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
      employee.save(validate: false)
      task.employees << employee
    end
    10.times do
      task.messages.build(user: user, message: Faker::Lorem.paragraph)
      task.messages.build(author: author, message: Faker::Lorem.paragraph)
    end
    task.save!(validate: false)
  end
end

