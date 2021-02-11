# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# the below class represents the conjured products
class Conjured < Item
  include StandardProcedures

  def initialize(name, sell_in, quality)
    super
    @standard_increment = STANDARD_INCREMENT
    @minimum_quality = MINIMUM_QUALITY
  end

  private

  def update_quality
    2.times do
      break if minimum_quality?

      @quality > 1 ? @quality -= @standard_increment * 2 : @quality -= @standard_increment
      break if @sell_in.positive?
    end
  end
end
