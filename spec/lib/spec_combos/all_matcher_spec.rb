require 'spec_combos/all_matcher'

describe 'all matcher' do
  it 'matches collections with all matching elements' do
    expect([1,3,5]).to all_ be_odd
  end

  it 'does not match collections where not all elements match' do
    expect([2,5,6]).not_to all_ be_even
  end
end
