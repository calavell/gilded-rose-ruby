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

  def decrease_quality(item)
    return if type_sulfuras?(item)

    2.times do
      break if minimum_quality?(item) == true

      item.quality -= 1
      break if item.sell_in.positive?
    end
  end

  def increase_quality(item)
    2.times do
      break if maximum_quality?(item) == true

      item.quality += 1
      break unless type_backstage_passes?(item)

      break unless item.sell_in <= 10
    end
  end

  def adjust_quality(item)
    type_brie?(item) || type_backstage_passes?(item) ? increase_quality(item) : decrease_quality(item)
  end

  def decrease_sellin(item)
    return if type_sulfuras?(item)

    item.sell_in -= 1
  end

  def minimum_quality?(item)
    item.quality == minimum_item_quality
  end

  def maximum_quality?(item)
    item.quality == maximum_item_quality
  end

  def type_sulfuras?(item)
    item.name == 'Sulfuras'
  end

  def type_brie?(item)
    item.name == 'Aged Brie'
  end

  def type_backstage_passes?(item)
    item.name == 'Backstage passes'
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
