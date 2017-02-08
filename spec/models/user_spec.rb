require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create :user }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it do
      should validate_length_of(:first_name).is_at_least(2).is_at_most(20)
    end
    it do
      should validate_length_of(:last_name).is_at_least(2).is_at_most(20)
    end
end
