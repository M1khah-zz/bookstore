require 'rails_helper'

RSpec.describe Book, type: :model do
  let (:book) {FactoryGirl.create :book}

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to belong_to(:author)}
  it { is_expected.to validate_presence_of(:description)}
  it { is_expected.to belong_to(:category)}
  it do
     is_expected.to validate_length_of(:description).is_at_least(5).is_at_most(255)
  end
  it do
     is_expected.to validate_length_of(:title).is_at_least(2).is_at_most(50)
  end
end
