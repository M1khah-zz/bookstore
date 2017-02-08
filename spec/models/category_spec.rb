require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create :category }

    it { should validate_presence_of(:title) }
    it do
      should validate_length_of(:title).is_at_least(2).is_at_most(15)
    end
    it {should have_many(:books)}
end
