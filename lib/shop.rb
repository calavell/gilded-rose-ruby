# frozen_string_literal: true

require_relative './item'

# the below class represents the gilded rose inn shop
class Shop
  MAXIMUM_ITEM_QUALITY = 50
  MINIMUM_ITEM_QUALITY = 0
  attr_reader :items, :maximum_item_quality, :minimum_item_quality

  def initialize(items)
    @items = items
    @maximum_item_quality = MAXIMUM_ITEM_QUALITY
    @minimum_item_quality = MINIMUM_ITEM_QUALITY
  end

  def update_quality
    @items.each do |item|
      adjust_quality(item)
      decrease_sellin(item)
    end
  end

  private

  def minimum_quality?(item)
    item.quality == self.minimum_item_quality
  end

  def maximum_quality?(item)
    item.quality == self.maximum_item_quality
  end

  def decrease_quality(item)
    for i in 1..2 do
      break if minimum_quality?(item) == true
      item.quality -= 1
      break if item.sell_in.positive?
    end
  end

  def increase_quality(item)
    return if maximum_quality?(item) == true

    item.quality += 1
  end

  def decrease_sellin(item)
    item.sell_in -= 1
  end

  def adjust_quality(item)
    item.name == 'brie' ? increase_quality(item) : decrease_quality(item)
  end
  # def update_quality()
  #   @items.each do |item|
  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end
end
