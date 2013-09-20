module SpecCombos

  # Matcher to verify that an item matches all matchers in a list
  class AndMatcher
    include MatcherCombiner
    include MatcherCombiner::And

    def initialize(*matchers)
      @matchers = matchers
    end

    def description
      descriptions = @matchers.map &:description

      if descriptions.size <= 2
        descriptions.join(" and ")
      else
        descriptions[0..-2].join(", ") + " and " + descriptions.last
      end
    end

    private

    def perform_matches(actual)
      @matchers.map do |matcher|
        { matcher: matcher,
          match: matcher.matches?(actual)}
      end
    end

    def failure_summary_for_should
      "expected #{actual} to #{description}, but:"
    end

    def failure_summary_for_should_not
      "expected #{actual} not to #{description}, but it is all:"
    end

  end
end

def and_(*matchers)
  SpecCombos::AndMatcher.new(*matchers)
end
