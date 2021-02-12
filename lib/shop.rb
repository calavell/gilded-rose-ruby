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
    assign_custom_rules_to_items
  end

  def update_quality
    @items.each(&:update_item)
  end

  private

  def assign_custom_rules_to_items
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        item.extend(AgedBrie)
      when 'Backstage pass'
        item.extend(BackstagePass)
      when 'Sulfuras'
        item.extend(Sulfuras)
      when 'Conjured'
        item.extend(Conjured)
      else
        item.extend(StandardProcedures)
      end
    end
  end
end
