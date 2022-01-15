# frozen_string_literal: true

user = User.find_or_initialize_by(email: 'test@test.com')
user.assign_attributes(address: Faker::Address.country, password: 'aassdd', password_confirmation: 'aassdd', name: 'Rodrigo')
# user.skip_confirmation!
user.save!


author = User.find_or_initialize_by(email: 'faker@test.com')
author.assign_attributes(address: Faker::Address.country, password: 'aassdd', password_confirmation: 'aassdd', name: 'Author')
# author.skip_confirmation!
author.save!