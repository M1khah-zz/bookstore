require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create :category }

    it {  is_expected.to validate_presence_of(:title) }
    it do
       is_expected.to validate_length_of(:title).is_at_least(2).is_at_most(15)
    end
    it { is_expected.to have_many(:books)}
end
