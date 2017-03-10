require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { FactoryGirl.create :author }

  it { is_expected.to validate_presence_of(:firstname)}
  it { is_expected.to validate_presence_of(:lastname)}
  it { is_expected.to have_many(:books)}
  it do
     is_expected.to validate_length_of(:firstname).is_at_least(2).is_at_most(20)
  end
  it do
     is_expected.to validate_length_of(:lastname).is_at_least(2).is_at_most(20)
  end
end
