require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { FactoryGirl.create :author }

  it {should validate_presence_of(:firstname)}
  it {should validate_presence_of(:lastname)}
  it {should have_many(:books)}
  it do
    should validate_length_of(:firstname).is_at_least(2).is_at_most(20)
  end
  it do
    should validate_length_of(:lastname).is_at_least(2).is_at_most(20)
  end
end
