require 'rails_helper'

RSpec.describe "/tasks/messages", type: :request do

  before do
    sign_in create(:user)
  end
  let!(:task) { create(:task) }
end
