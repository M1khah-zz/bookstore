require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create :user }

    it {  is_expected.to validate_presence_of(:email) }
    it {  is_expected.to validate_presence_of(:password) }
    it {  is_expected.to validate_presence_of(:firstname) }
    it {  is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to have_many(:ratings)}
    it { is_expected.to have_many(:orders)}
    it do
       is_expected.to validate_length_of(:firstname).is_at_least(2).is_at_most(50)
    end
    it do
       is_expected.to validate_length_of(:lastname).is_at_least(2).is_at_most(50)
    end
end
