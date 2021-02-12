# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# the below class represents the brie products
class BackstagePass < Item
  include StandardProcedures

  DOUBLE_INCREMENT_LIMIT = 10
  TRIPLE_INCREMENT_LIMIT = 5

  def update_item
    depreciate_quality if expired?
    update_quality unless expired?
    update_sellin
  end

  private

  def update_quality
    i = 1
    3.times do
      break if maximum_quality?

      @quality += STANDARD_INCREMENT
      break if @sell_in > DOUBLE_INCREMENT_LIMIT
      break if @sell_in > TRIPLE_INCREMENT_LIMIT && i == 2

      i += 1
    end
  end

  def depreciate_quality
    @quality = MINIMUM_QUALITY if expired?
  end

  def expired?
    @sell_in <= SELL_BY_DATE
  end
end
