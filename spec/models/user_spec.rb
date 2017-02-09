require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create :user }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
    it do
      should validate_length_of(:firstname).is_at_least(2).is_at_most(20)
    end
    it do
      should validate_length_of(:lastname).is_at_least(2).is_at_most(20)
    end
end
