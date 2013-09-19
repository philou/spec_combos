require 'spec_combos/any_matcher'

describe 'have_any_that matcher' do
  it 'matches collections with at least one matching element' do
    expect([2,3,4]).to have_any_that { be_odd }
  end

  it 'does not match collections where no element match' do
    expect([2,4,6]).not_to have_any_that { be_odd }
  end

  it "has a straigtforward description" do
    matcher = have_any_that { be_odd }

    expect(matcher.description).to eq "have any that #{be_odd.description}"
  end

  it 'has an explicit should message' do
    expect do
      expect([0,2]).to have_any_that { be_odd }

    end.to raise_error(RSpec::Expectations::ExpectationNotMetError,
                       "expected [0, 2] to have any that be odd, but none were:\n" +
                       "  #0, 0 : expected odd? to return true, got false\n" +
                       "  #1, 2 : expected odd? to return true, got false")
  end

  it 'has an explicit should not message' do
    expect do
      expect([1,4,6]).not_to have_any_that { be_odd }

    end.to raise_error(RSpec::Expectations::ExpectationNotMetError,
                       "expected [1, 4, 6] not to have any that be odd, but the following were:\n" +
                       "  #0, 1 : expected odd? to return false, got true")
  end

end
