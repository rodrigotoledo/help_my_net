require 'rails_helper'

RSpec.describe Company, type: :model do
  it "is valid with valid attributes" do
    expect(Company.new(attributes_for(:company))).to be_valid
  end
  it "is invalid with valid attributes" do
    expect(Company.new).to be_invalid
  end
end
