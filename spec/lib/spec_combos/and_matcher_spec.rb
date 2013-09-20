require 'spec_helper'

module SpecCombos

  describe AndMatcher do
    it 'matches items that matches all matchers' do
      expect(2).to and_(be_even,
                        be_instance_of(Fixnum))
    end

    it "does not match items that don't match all matchers" do
      expect(2).not_to and_(be_odd,
                            be_even)
    end

    it "has a straigtforward description" do
      matcher = and_(be_odd, be_even)

      expect(matcher.description).to eq "#{be_odd.description} and #{be_even.description}"
    end

    it "does not repeat 'and' in the description" do
      matcher = and_(be_odd, be_even, be_instance_of(Fixnum))

      expect(matcher.description).to eq "#{be_odd.description}, #{be_even.description} and #{be_instance_of(Fixnum).description}"
    end

    it 'has an explicit should message' do
      expect do
        expect(1).to and_(be_odd, be_even)

      end.to raise_error(RSpec::Expectations::ExpectationNotMetError,
                         "expected 1 to be odd and be even, but:\n" +
                         "  expected even? to return true, got false")
    end

    it 'has an explicit should not message' do
      expect do
        expect(2).not_to and_(be_even, be_instance_of(Fixnum))

      end.to raise_error(RSpec::Expectations::ExpectationNotMetError,
                         "expected 2 not to be even and be an instance of Fixnum, but it is all:\n" +
                         "  expected even? to return false, got true\n" +
                         "  expected 2 not to be an instance of Fixnum")
    end
  end
end
