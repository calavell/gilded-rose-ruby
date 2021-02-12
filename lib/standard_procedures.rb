# frozen_string_literal: true

# this module contains the standard quality and sellin adjustment methods for any new product
module StandardProcedures
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0
  STANDARD_INCREMENT = 1
  SELL_BY_DATE = 0

  def minimum_quality?
    MINIMUM_QUALITY == @quality
  end

  def maximum_quality?
    MAXIMUM_QUALITY == @quality
  end

  def update_sellin
    @sell_in -= STANDARD_INCREMENT
  end

  def update_quality
    2.times do
      break if minimum_quality?

      @quality -= STANDARD_INCREMENT
      break if @sell_in.positive?
    end
  end

  def update_item
    update_quality
    update_sellin
  end
end
