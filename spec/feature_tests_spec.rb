# frozen_string_literal: true

require 'shop'
require 'item'

describe 'Update shop' do
  it 'updates the quality and sellin for a suite of products' do
    conjured = Item.new('Conjured', 30, 30)
    brie = Item.new('Aged Brie', 20, 30)
    backstage_pass = Item.new('Backstage pass', 14, 43)
    sulfuras = Item.new('Sulfuras', 5, 35)
    car = Item.new('Car', 40, 45)
    conjured.extend(Conjured)
    brie.extend(AgedBrie)
    backstage_pass.extend(BackstagePass)
    sulfuras.extend(Sulfuras)
    car.extend(StandardProcedures)
    inventory = [conjured, brie, backstage_pass, sulfuras, car]
    shop = Shop.new(inventory)
    shop.update_quality
    expect(shop.items[0].to_s).to eq 'Conjured, 29, 28'
    expect(shop.items[1].to_s).to eq 'Aged Brie, 19, 31'
    expect(shop.items[2].to_s).to eq 'Backstage pass, 13, 44'
    expect(shop.items[3].to_s).to eq 'Sulfuras, 5, 35'
    expect(shop.items[4].to_s).to eq 'Car, 39, 44'
  end

  it 'updates the quality and sellin for a suite of products woth negative sellins' do
    conjured = Item.new('Conjured', -30, 30)
    brie = Item.new('Aged Brie', -20, 30)
    backstage_pass = Item.new('Backstage pass', -14, 0)
    sulfuras = Item.new('Sulfuras', -5, 35)
    car = Item.new('Car', -40, 45)
    conjured.extend(Conjured)
    brie.extend(AgedBrie)
    backstage_pass.extend(BackstagePass)
    sulfuras.extend(Sulfuras)
    car.extend(StandardProcedures)
    inventory = [conjured, brie, backstage_pass, sulfuras, car]
    shop = Shop.new(inventory)
    shop.update_quality
    expect(shop.items[0].to_s).to eq 'Conjured, -31, 26'
    expect(shop.items[1].to_s).to eq 'Aged Brie, -21, 31'
    expect(shop.items[2].to_s).to eq 'Backstage pass, -15, 0'
    expect(shop.items[3].to_s).to eq 'Sulfuras, -5, 35'
    expect(shop.items[4].to_s).to eq 'Car, -41, 43'
  end
end
