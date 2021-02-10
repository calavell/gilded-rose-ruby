# frozen_string_literal: true

require_relative './item'

# the below class represents the gilded rose inn shop
class Shop
  MAXIMUM_ITEM_QUALITY = 50
  MINIMUM_ITEM_QUALITY = 0
  DOUBLE_INCREMENT_LIMIT = 10
  TRIPLE_INCREMENT_LIMIT = 5
  STANDARD_INCREMENT = 1
  attr_reader :items, :maximum_item_quality, :minimum_item_quality

  def initialize(items)
    @items = items
    @maximum_item_quality = MAXIMUM_ITEM_QUALITY
    @minimum_item_quality = MINIMUM_ITEM_QUALITY
    @double_increment_limit = DOUBLE_INCREMENT_LIMIT
    @triple_increment_limit = TRIPLE_INCREMENT_LIMIT
    @standard_increment = STANDARD_INCREMENT
  end

  def update_quality
    @items.each do |item|
      depreciate_expired_backstage_passes(item) if backstage_passes_expired?(item)
      adjust_quality(item) unless backstage_passes_expired?(item)
      decrease_sellin(item)
    end
  end

  private

  def decrease_quality(item)
    return if type_sulfuras?(item)

    2.times do
      break if minimum_quality?(item) == true

      type_conjured?(item) && item.quality > 1 ? item.quality -= STANDARD_INCREMENT * 2 : item.quality -= STANDARD_INCREMENT
      break if item.sell_in.positive?
    end
  end

  def increase_quality(item)
    i = 1
    3.times do
      break if maximum_quality?(item) == true

      item.quality += STANDARD_INCREMENT
      break unless type_backstage_passes?(item)
      break unless item.sell_in <= DOUBLE_INCREMENT_LIMIT
      break if item.sell_in > TRIPLE_INCREMENT_LIMIT && i == 2

      i += 1
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

  def type_conjured?(item)
    item.name == 'Conjured'
  end

  def backstage_passes_expired?(item)
    item.sell_in <= 0 && type_backstage_passes?(item)
  end

  def depreciate_expired_backstage_passes(item)
    item.quality = minimum_item_quality if backstage_passes_expired?(item)
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
