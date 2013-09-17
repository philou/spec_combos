# Matcher to verify that at least one item matches something else
RSpec::Matchers.define :have_any_that do |item_matcher|

  match do |actual_items|
    actual_items.any? { |item| item_matcher.matches?(item)}
  end

  description do
    "#{item_matcher.description} to be true for at least one item"
  end

end
