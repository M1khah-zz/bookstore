require 'rails_helper'

RSpec.describe Coupon, type: :model do
  let(:coupon) { FactoryGirl.create :coupon }

    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }
    # it { is_expected.to validate_length_of(:value).is_equal_to(5) }
    it { is_expected.to belong_to (:order) }
end
