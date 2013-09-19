require 'spec_combos/all_matcher'

describe 'all matcher' do
  it 'matches collections with all matching elements' do
    expect([1,3,5]).to all_ { be_odd }
  end

  it 'does not match collections where not all elements match' do
    expect([3,5,6]).not_to all_ { be_odd }
  end

  it "has a straigtforward description" do
    matcher = all_ { be_odd }

    expect(matcher.description).to eq "all #{be_odd.description}"
  end

  it 'has an explicit should message' do
    expect do
      expect([1,2,3]).to all_ { be_odd }

    end.to raise_error(RSpec::Expectations::ExpectationNotMetError,
                       "expected [1, 2, 3] to all be odd, but the following were not:\n" +
                       "  #1, 2 : expected odd? to return true, got false")
  end

  it 'has an explicit should not message' do
    expect do
      expect([1,3]).not_to all_ { be_odd }

    end.to raise_error(RSpec::Expectations::ExpectationNotMetError,
                       "expected [1, 3] not to all be odd, but all were:\n" +
                       "  #0, 1 : expected odd? to return false, got true\n" +
                       "  #1, 3 : expected odd? to return false, got true")
  end
end
