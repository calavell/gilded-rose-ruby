# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# the below class represents the brie products
class AgedBrie < Item
  include StandardProcedures
  MAXIMUM_QUALITY = 50
  STANDARD_INCREMENT = 1

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
