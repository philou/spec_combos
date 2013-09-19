require_relative "collection_matcher"

module SpecCombos

  # Matcher to verify that all items match something else
  class AllMatcher
    include CollectionMatcher

    protected

    def match_result
      matches(NOT_MATCHING).empty?
    end

    def short_description
      "all"
    end

    def failure_summary_for_should
      "expected #{actual_items} to #{description}, but the following were not:"
    end

    def failure_summary_for_should_not
      "expected #{actual_items} not to #{description}, but all were:"
    end
  end
end

def all_(&item_matcher_proc)
  SpecCombos::AllMatcher.new(&item_matcher_proc)
end
