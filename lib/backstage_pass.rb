# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# the below class represents the brie products
class BackstagePass < Item
  include StandardProcedures

  def initialize(name, sell_in, quality)
    super
    @standard_increment = STANDARD_INCREMENT
    @triple_increment_limit = TRIPLE_INCREMENT_LIMIT
    @double_increment_limit = DOUBLE_INCREMENT_LIMIT
    @sell_by_date = SELL_BY_DATE
    @minimum_quality = MINIMUM_QUALITY
  end

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

      @quality += @standard_increment
      break if @sell_in > @double_increment_limit
      break if @sell_in > @triple_increment_limit && i == 2

      i += 1
    end
  end

  def depreciate_quality
    @quality = @minimum_quality if expired?
  end

  def expired?
    @sell_in <= @sell_by_date
  end
end
