# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# this a template class for any new products which get added to stock
class SampleProduct < Item
  # The above line ensures that any new product will inherit the same properties as all other items

  include StandardProcedures
  # The above line ensures that any new products inherits the standard methods
  # to adjust the quality and sellin value of an item
  # it takes maximum quality of 50 and minimum quality of zero.

  def initialize(name, sell_in, quality)
    super
    @minimum_quality = MINIMUM_QUALITY
    @standard_increment = STANDARD_INCREMENT
    @sell_by_date = SELL_BY_DATE
  end
  # These are the base properties which each new product needs.
  # You can add more into a new class by defining a new constant in
  # './stands_procedures.rb'

  # If you need to include special methods to override the default ones, you can write them
  # under these lines. Remember to keep any methods private unless they need to be public.
end
