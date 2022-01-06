require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "validation" do
    let(:subject) { build(:employee)}

    it 'should be valid' do
      expect(subject).to be_valid
    end

    describe '::invalid' do
      let(:subject) { Employee.new }
      before do
        subject.valid?
      end

      it 'should be invalid' do
        expect(subject).to be_invalid
      end

      it 'should have errors' do
        expect(subject.errors.size).to eql(3)
      end
    end
  end
  describe '#nearest_tasks' do
    let(:subject) { create(:employee, latitude: -19.7850743, longitude: -42.1429731)}

    before do
      create_list(:task, 2, latitude: subject.latitude, longitude: subject.longitude)
      create(:task, latitude: -20.2258579, longitude: -42.651091)
    end

    it 'have 2 tasks closest' do
      expect(subject.nearest_tasks.size).to eql(2)
    end
  end
end
