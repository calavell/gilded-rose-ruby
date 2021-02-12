# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# the below class represents the conjured products
class Conjured < Item
  include StandardProcedures

  private

  def update_quality
    2.times do
      break if minimum_quality?

      @quality -= @quality > 1 ? STANDARD_INCREMENT * 2 : STANDARD_INCREMENT
      break if @sell_in.positive?
    end
  end
end
