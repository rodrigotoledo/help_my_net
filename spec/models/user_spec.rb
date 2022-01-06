# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    let(:user) { build(:user) }

    it 'should be valid' do
      expect(user).to be_valid
    end

    describe '::invalid' do
      let(:user) { User.new }

      before do
        user.valid?
      end
      it 'should be invalid' do
        expect(user).to be_invalid
      end

      it 'should have errors' do
        expect(user.errors.size).to eql(2)
      end

      context "invalid password" do
        before do
          user.email = Faker::Internet.email
          user.password = 'aassdd'
          user.password_confirmation = 'aassdda'
          user.valid?
        end
        it 'should have errors' do
          expect(user.errors.size).to eql(1)
        end
      end
    end
  end

  describe 'update_access_token' do
    let(:subject) { create(:user) }
    it 'access_token should have access' do
      expect(subject.access_token).not_to be_blank
    end
  end

end
