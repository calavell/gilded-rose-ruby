# frozen_string_literal: true

require 'shop'
require 'item'

describe Shop do
  describe '#update_quality' do
    let(:conjured) { double(Item, name: 'Conjured', sell_in: 30, quality: 30) }
    let(:brie) { double(Item, name: 'Aged Brie', sell_in: 20, quality: 30) }
    let(:backstage_pass) { double(Item, name: 'Backstage pass', sell_in: 14, quality: 43) }
    let(:sulfuras) { double(Item, name: 'Sulfuras', sell_in: 5, quality: 35) }
    let(:inventory) { [conjured, brie, backstage_pass, sulfuras] }
    let(:shop) { described_class.new(inventory) }
    it 'calls update_item on each element of items array' do
      shop.items.each do |item|
        expect(item).to receive(:update_item).exactly(1).time
      end
      shop.update_quality
    end
  end
end
