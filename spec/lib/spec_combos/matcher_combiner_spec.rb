require 'spec_helper'

module SpecCombos

  describe MatcherCombiner do
    it 'can combine :all_ and :and_ matcher messages correctly' do
      expect do
        expect([1,2,3]).to all_{and_(be_odd, be_instance_of(Fixnum))}

      end.to raise_error(RSpec::Expectations::ExpectationNotMetError,
                         "expected [1, 2, 3] to all be odd and be an instance of Fixnum, but the following were not:\n"+
                         "  [1] (2): expected 2 to be odd and be an instance of Fixnum, but:\n"+
                         "    expected odd? to return true, got false")
    end
  end
end
