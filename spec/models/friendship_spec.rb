require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'checks if belongs to User' do
    should belong_to(:user)
  end

  it 'checks if belongs to User' do
    should belong_to(:friend)
  end
end
