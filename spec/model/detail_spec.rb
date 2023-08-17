require 'rails_helper'

RSpec.describe Detail, type: :model do
  detail = Detail.create(name: 'FastFood', amount: 10)

  it 'is not valid without a name' do
    detail.name = nil
    expect(detail).to_not be_valid
  end

  it 'is not valid if amount is not a number' do
    detail.amount = '10'
    expect(detail).to_not be_valid
  end
end
