# frozen_string_literal: true
require "cpf_cnpj"
user = User.find_or_initialize_by(email: 'test@test.com')
user.assign_attributes(address: Faker::Address.country, password: 'aassdd', password_confirmation: 'aassdd', name: 'Rodrigo')
# user.skip_confirmation!
user.save!


author = User.find_or_initialize_by(email: 'faker@test.com')
author.assign_attributes(address: Faker::Address.country, password: 'aassdd', password_confirmation: 'aassdd', name: 'Author')
# author.skip_confirmation!
author.save!

cities = ['Caratinga - MG', 'Ipatinga - MG', 'Belo Horizonte - MG']
company = Company.create(name: Faker::Company.name)
employee = Employee.create(address: cities.sample, email: Faker::Internet.email, password: 'aassdd', password_confirmation: 'aassdd', name: Faker::Name.name_with_middle, document: CPF.generate(true) )
user = User.create(address: cities.sample, email: Faker::Internet.email, password: 'aassdd', password_confirmation: 'aassdd', name: Faker::Name.name_with_middle)
2.times do
  task = Task.create(employee: employee, title: Faker::Job.title, description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), address: cities.sample, company: company, user: user)
  task.messages.build(employee_id: employee.id, message: Faker::Lorem.sentence)
  task.messages.build(user_id: user.id, message: Faker::Lorem.sentence)
  task.save
end