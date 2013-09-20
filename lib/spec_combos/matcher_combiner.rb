module SpecCombos

  module MatcherCombiner

    module And
      def match_result
        matches(NOT_MATCHING).empty?
      end
    end

    module Or
      def match_result
        !matches(MATCHING).empty?
      end
    end

    def matches?(actual)
      @actual = actual
      @match_details = perform_matches(actual)
      match_result
    end

    def failure_message_for_should
      failure_message(MATCHING, failure_summary_for_should)
    end

    def failure_message_for_should_not
      failure_message(NOT_MATCHING, failure_summary_for_should_not)
    end

    private

    attr_reader :actual

    MATCHING = true
    NOT_MATCHING = false
    INDENT_WIDTH = 2

    def failure_message(expected_match, summary)
      summary + "\n" + indent(full_explanation(expected_match), INDENT_WIDTH)
    end
    def full_explanation(expected_match)
      explanations(!expected_match).join("\n")
    end
    def explanations(expected_match)
      matches(expected_match).map {|failure| explain(failure)}
    end
    def explain(failure)
      failure_message_prefix(failure) + message(failure)
    end
    def failure_message_prefix(failure)
      ""
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

    def matches(expected_match)
      @match_details.find_all {|detail| detail[:match] == expected_match}
    end

    def indent(text, tabs)
      text.gsub(/^/, ' ' * tabs)
    end
  end

end
