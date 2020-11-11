require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'checks if content is present' do
    should validate_presence_of(:content)
  end

  it 'checks if belongs to User' do
    should belong_to(:user)
  end

  it 'checks if has many comments' do
    should have_many(:comments)
  end

  it 'checks if has many likes' do
    should have_many(:likes)
  end
end
