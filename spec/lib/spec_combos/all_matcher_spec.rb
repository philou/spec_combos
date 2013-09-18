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

  context "error messages" do
    before :each do
      @matcher = all_ { be_odd }
      @matcher.matches?([1,2,3])
    end

    it 'has an explicit should message' do
      expect(@matcher.failure_message_for_should).to eq(
        "expected [1, 2, 3] to all be odd, but the following items were not:\n" +
        "  #1, 2 : expected odd? to return true, got false")
    end

    it 'has an explicit should not message' do
      expect(@matcher.failure_message_for_should_not).to eq(
        "expected [1, 2, 3] not to all be odd, but the following items were:\n" +
        "  #0, 1 : expected odd? to return false, got true\n" +
        "  #2, 3 : expected odd? to return false, got true")
    end
  end
end
