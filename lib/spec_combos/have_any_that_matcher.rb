require_relative "collection_matcher"

module SpecCombos

  # Matcher to verify that all items match something else
  class AnyMatcher
    include CollectionMatcher

    def initialize(&item_matcher_proc)
      @item_matcher_proc = item_matcher_proc
    end

    def matches?(actual_items)
      perform_matches(actual_items)
      !matches(MATCHING).empty?
    end

    def description
      "have any that #{@item_matcher_proc.call.description}"
    end

    def failure_message_for_should
      failure_message(MATCHING, "expected #{actual_items} to #{description}, but none were:")
    end

    def failure_message_for_should_not
      failure_message(NOT_MATCHING, "expected #{actual_items} not to #{description}, but the following were:")
    end
  end
end

def have_any_that(&item_matcher_proc)
  SpecCombos::AnyMatcher.new(&item_matcher_proc)
end
