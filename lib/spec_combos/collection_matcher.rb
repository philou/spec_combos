module SpecCombos
  module CollectionMatcher

    protected

    MATCHING = true
    NOT_MATCHING = false

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
      ([summary] + explanations(!expected_match)).join("\n")
    end
    def actual_items
      @match_details.map {|detail| detail[:item]}
    end
    def explanations(expected_match)
      matches(expected_match).map {|failure| explain(failure)}
    end
    def matches(expected_match)
      @match_details.find_all {|detail| detail[:match] == expected_match}
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
