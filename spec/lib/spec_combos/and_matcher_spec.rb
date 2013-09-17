require 'spec_combos/and_matcher'

describe 'and matcher' do
  it 'matches items that matches all matchers' do
    expect(2).to and_(be_even,
                      be_instance_of(Fixnum))
  end

  it "does not match items that don't mach all matchers" do
    expect(2).not_to and_(be_odd,
                          be_even)
  end
end
