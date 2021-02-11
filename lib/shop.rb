# frozen_string_literal: true

require_relative './item'
require_relative './aged_brie'
require_relative './backstage_pass'
require_relative './sulfuras'
require_relative './conjured'

# the below class represents the gilded rose inn shop
class Shop
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update_item)
  end
end
