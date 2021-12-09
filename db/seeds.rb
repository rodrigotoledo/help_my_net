# frozen_string_literal: true

10.times do
  category = Category.create!(title: Faker::Job.title)
  4.times do
    task = category.tasks.build(title: Faker::Job.title, description: Faker::Lorem.paragraph)
    task.save(validate: false)
  end
end

user = User.new(email: 'test@test.com', password: 'aassdd', password_confirmation: 'aassdd',
                first_name: 'Rodrigo', last_name: 'Toledo')
user.skip_confirmation!
user.save
