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
  end
  # These are the base properties which each new product needs.

  # If you need to include special methods to override the default ones, you can write them
  # under these lines. Remember to keep any methods private unless they need to be public.

  # To understand the standard methods, when the shop updates its quality, it will call the
  # update_item method on the product. If you go to './stands_procedures.rb', you can see what
  #  this method entails. Only add new methods if that flow is not going to work for the new product.
  # Try to stick to the naming conventions of using update_item, update_quality and update_sellin.
end
