# Matcher to verify that all items match something else
RSpec::Matchers.define :all_ do |item_matcher|

  match do |actual_items|
    actual_items.all? { |item| item_matcher.matches?(item)}
  end

  description do
    "#{item_matcher.description} to be true for all the items"
  end

end
