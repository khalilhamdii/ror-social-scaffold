require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'checks if content is present' do
    should validate_presence_of(:content)
  end

  it 'checks if belongs to User' do
    should belong_to(:post)
  end
end
