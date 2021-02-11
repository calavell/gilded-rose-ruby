# frozen_string_literal: true

# this module contains the standard quality and sellin adjustment methods for any new product
module StandardProcedures
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
