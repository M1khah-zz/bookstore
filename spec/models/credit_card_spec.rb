require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  let(:credit_card) { FactoryGirl.create :credit_card }

    it {  is_expected.to validate_presence_of(:cvv) }
    it {  is_expected.to validate_presence_of(:number) }
    it {  is_expected.to validate_presence_of(:exp_year) }
    it {  is_expected.to validate_presence_of(:exp_month) }
    it {  is_expected.to validate_presence_of(:firstname) }
    it {  is_expected.to validate_presence_of(:lastname) }
end
