require_relative "collection_matcher"

module SpecCombos

  # Matcher to verify that all items match something else
  class AnyMatcher
    include CollectionMatcher

    protected

    def match_result
      !matches(MATCHING).empty?
    end

    def short_description
      "have any that"
    end

    def failure_summary_for_should
      "expected #{actual_items} to #{description}, but none were:"
    end

    def failure_summary_for_should_not
      "expected #{actual_items} not to #{description}, but the following were:"
    end
  end
end

def any_(&item_matcher_proc)
  SpecCombos::AnyMatcher.new(&item_matcher_proc)
end
alias :have_any_that :any_
