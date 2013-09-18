# Matcher to verify that all items match something else

module SpecCombos
  class AllMatcher

    def initialize(&item_matcher_proc)
      @item_matcher_proc = item_matcher_proc
    end

    def matches?(actual_items)
      perform_matches(actual_items)
      failures(true).empty?
    end

    def description
      "all #{@item_matcher_proc.call.description}"
    end

    def failure_message_for_should
      failure_message(SHOULD, "expected #{actual_items} to #{description}, but the following items were not:")
    end

    def failure_message_for_should_not
      failure_message(SHOULD_NOT, "expected #{actual_items} not to #{description}, but the following items were:")
    end

    private

    SHOULD = true
    SHOULD_NOT = false

    def perform_matches(actual_items)
      @match_details = actual_items.each_with_index.map do |item, index|
        matcher = @item_matcher_proc.call
        { index: index,
          item: item,
          matcher: matcher,
          match: matcher.matches?(item)}
      end
    end
    def failure_message(expected_match, summary)
      ([summary] + explanations(expected_match)).join("\n")
    end
    def actual_items
      @match_details.map {|detail| detail[:item]}
    end
    def explanations(expected_match)
      failures(expected_match).map {|failure| explain(failure)}
    end
    def failures(expected_match)
      @match_details.find_all {|detail| detail[:match] != expected_match}
    end
    def explain(failure)
        "  ##{failure[:index]}, #{failure[:item]} : #{message(failure)}"
    end
    def message(failure)
      failure[:matcher].send(message_selector(failure))
    end
    def message_selector(failure)
      if failure[:match]
        :failure_message_for_should_not
      else
        :failure_message_for_should
      end
    end
  end
end

def all_(&item_matcher_proc)
  SpecCombos::AllMatcher.new(&item_matcher_proc)
end
