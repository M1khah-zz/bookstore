require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order_item) { FactoryGirl.create :order_item }

    it {  is_expected.to validate_presence_of(:price) }
    it {  is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:price) }
    it { is_expected.to validate_numericality_of(:quantity) }
end
