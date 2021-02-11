# frozen_string_literal: true

# this module contains the standard quality and sellin adjustment methods for any new product
module StandardProcedures
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0
  DOUBLE_INCREMENT_LIMIT = 10
  TRIPLE_INCREMENT_LIMIT = 5
  STANDARD_INCREMENT = 1
  SELL_BY_DATE = 0
  
  def minimum_quality?
    @minimum_quality == @quality
  end

  def maximum_quality?
    @maximum_quality == @quality
  end

  def update_sellin
    @sell_in -= @standard_increment
  end

  def update_quality
    2.times do
      break if minimum_quality?

      @quality -= @standard_increment
      break if @sell_in.positive?
    end
  end

  def update_item
    update_quality
    update_sellin
  end
end
