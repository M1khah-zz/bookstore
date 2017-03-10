require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) {FactoryGirl.create :rating}

  it { is_expected.to belong_to(:user)}
  it { is_expected.to belong_to(:book)}
  it { is_expected.to validate_presence_of(:review)}
  it { is_expected.to validate_presence_of(:user_id)}
  it { is_expected.to validate_presence_of(:book_id)}
  it { is_expected.to validate_presence_of(:rating)}
  it do
     is_expected.to validate_length_of(:review).is_at_least(5).is_at_most(500)
  end

end
