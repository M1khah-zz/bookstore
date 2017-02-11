require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) {FactoryGirl.create :rating}

  it {should belong_to(:user)}
  it {should belong_to(:book)}
  it {should validate_presence_of(:review)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:book_id)}
  it {should validate_presence_of(:rating)}
  it do
    should validate_length_of(:review).is_at_least(5).is_at_most(100)
  end

end
