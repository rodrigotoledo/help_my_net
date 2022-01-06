require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "validation" do
    let(:subject) { build(:message)}

    it 'should be valid' do
      expect(subject).to be_valid
    end

    describe '::invalid' do
      let(:subject) { Message.new }
      before do
        subject.valid?
      end

      it 'should be invalid' do
        expect(subject).to be_invalid
      end

      it 'should have errors' do
        expect(subject.errors.size).to eql(2)
      end
    end
  end
end
