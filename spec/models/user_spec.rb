require 'rails_helper'

RSpec.describe User, type: :model do
  it 'checks if name is present' do
    should validate_presence_of(:name)
  end

  it 'checks if has many posts' do
    should have_many(:posts)
  end

  it 'checks if has many comments' do
    should have_many(:comments)
  end

  it 'checks if has many likes' do
    should have_many(:likes)
  end

  it 'checks if has many friendships' do
    should have_many(:friendships)
  end

  it 'checks if has many inverse friendships' do
    should have_many(:inverse_friendships)
  end
end
