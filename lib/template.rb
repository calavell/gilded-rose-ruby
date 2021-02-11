# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# this a template class for any new products which get added to stock

class SampleProduct < Item
  #The above line ensures that any new product will inherit the same properties as all other items

  include StandardProcedures
  # the above line ensures that any new products inherits the standard methods to adjust the quality and sellin value of an item
  # it takes maximum quality of 50 and minimum quality of zero

  def initialize(name, sell_in, quality)
    super
    @maximum_quality = MAXIMUM_QUALITY
    @standard_increment = STANDARD_INCREMENT
  end

  private

  def update_quality
    @quality += @standard_increment unless maximum_quality?
  end
end
