require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do
    @order = Order.new
  end

  it {is_expected.to have_one(:coupon)}
  it { is_expected.to have_many(:order_items)}

  it 'Changes it state on process event' do
    expect(@order).to transition_from(:in_progress).to(:in_queue).on_event(:process)
    expect(@order).not_to transition_from(:in_progress).to(:in_delivery).on_event(:process)
    expect(@order).to have_state(:in_queue)
    expect(@order).not_to have_state(:in_progress)
    expect(@order).to allow_event :ship
    expect(@order).to_not allow_event :process
    expect(@order).to allow_transition_to(:in_delivery)
    expect(@order).to_not allow_transition_to(:in_queue)
  end

  it 'Changes it state on ship event' do
    expect(@order).to transition_from(:in_queue).to(:in_delivery).on_event(:ship)
    expect(@order).not_to transition_from(:in_queue).to(:canceled).on_event(:ship)
    expect(@order).to have_state(:in_delivery)
    expect(@order).not_to have_state(:in_queue)
    expect(@order).to allow_event :complete
    expect(@order).to_not allow_event :ship
    expect(@order).to allow_transition_to(:delivered)
    expect(@order).to_not allow_transition_to(:in_queue)
  end

  it 'Changes it state on complete event' do
    expect(@order).to transition_from(:in_queue,:in_delivery).to(:delivered).on_event(:complete)
    expect(@order).not_to transition_from(:in_queue,:in_delivery).to(:canceled).on_event(:complete)
    expect(@order).to have_state(:delivered)
    expect(@order).not_to have_state(:in_queue,:in_delivery)
    expect(@order).to_not allow_event :cancel
  end

  it 'Changes it state cancel event' do
    expect(@order).to transition_from(:in_queue, :in_delivery).to(:canceled).on_event(:cancel)
    expect(@order).not_to transition_from(:in_queue, :in_delivery).to(:in_delivery).on_event(:cancel)
    expect(@order).to have_state(:canceled)
    expect(@order).not_to have_state(:in_queue, :in_delivery)
    expect(@order).to_not allow_event :cancel
    expect(@order).to_not allow_transition_to(:in_queue, :in_delivery)
  end
end
