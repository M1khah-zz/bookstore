require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.create :order }

    it {is_expected.to have_many(:coupons)}
end
