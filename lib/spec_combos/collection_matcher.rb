module SpecCombos

  # Mixin for the :and and :any collection matchers
  module CollectionMatcher

    def initialize(&item_matcher_proc)
      @item_matcher_proc = item_matcher_proc
    end

    def description
      "#{short_description} #{new_matcher.description}"
    end

    private

    def perform_matches(actual_items)
      actual_items.each_with_index.map do |item, index|
        matcher = new_matcher
        { index: index,
          item: item,
          matcher: matcher,
          match: matcher.matches?(item)}
      end
    end

    def new_matcher
      @item_matcher_proc.call
    end

    def failure_message_prefix(failure)
      "[#{failure[:index]}] (#{failure[:item]}): "
    end

    def actual_items
      @actual
    end

  end
end
