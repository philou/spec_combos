require 'spec_combos/have_any_that_matcher'

describe 'have_any_that matcher' do
  it 'matches collections with at least one matching element' do
    expect([2,3,4]).to have_any_that be_odd
  end

  it 'does not match collections where no element match' do
    expect([2,4,6]).not_to have_any_that be_odd
  end
end
