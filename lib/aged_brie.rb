# frozen_string_literal: true

require_relative './item'
require_relative './standard_procedures'

# the below class represents the brie products
module AgedBrie
  include StandardProcedures

  private

  def update_quality
    @quality += STANDARD_INCREMENT unless maximum_quality?
  end
end
