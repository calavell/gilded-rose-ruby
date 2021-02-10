# frozen_string_literal: true

require 'shop'
require 'item'

describe Shop do
  describe '#update_quality' do
    context 'normal item, normal conditions' do
      let(:inventory) { [Item.new('toy', 20, 10)] }
      let(:shop) { described_class.new(inventory) }
      it 'does not change the name of the items' do
        shop.update_quality
        expect(shop.items[0].name).to eq 'toy'
      end

      it 'decreases sellin by 1 for all items' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq 19
      end

      it 'decreases quality by 1 for all items' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 9
      end
    end

    context 'normal item, normal sell_in, minimum quality' do
      let(:inventory) { [Item.new('toy', 20, 0)] }
      let(:shop) { described_class.new(inventory) }
      it 'does not decrease quality past zero' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 0
      end

      it 'does decrease sell_in still' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq 19
      end
    end

    context 'normal item, negative sell_in, normal quality' do
      let(:inventory) { [Item.new('toy', -20, 20)] }
      let(:shop) { described_class.new(inventory) }
      it 'decreases quality by 2' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 18
      end

      it 'does decrease sell_in still past zero' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq(-21)
      end
    end

    context 'normal item, negative sell_in, 1 quality' do
      let(:inventory) { [Item.new('toy', -20, 1)] }
      let(:shop) { described_class.new(inventory) }
      it 'does not decrease quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 0
      end
    end

    context 'brie, normal sell_in, normal quality' do
      let(:inventory) { [Item.new('Aged Brie', 20, 30)] }
      let(:shop) { described_class.new(inventory) }
      it 'increases in quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 31
      end

      it 'decreases in sell_in' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq 19
      end
    end

    context 'brie, normal sell_in, max quality' do
      let(:inventory) { [Item.new('Aged Brie', 20, 50)] }
      let(:shop) { described_class.new(inventory) }
      it 'will not increase quality past 50' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 50
      end
    end

    context 'sulfuras, normal sell_in, normal quality' do
      let(:inventory) { [Item.new('Sulfuras', 20, 30)] }
      let(:shop) { described_class.new(inventory) }
      it 'will not change the quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 30
      end

      it 'will not change the sell_in' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq 20
      end
    end

    context 'sulfuras, negative sell_in, maximum quality' do
      let(:inventory) { [Item.new('Sulfuras', -20, 50)] }
      let(:shop) { described_class.new(inventory) }
      it 'will not change the quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 50
      end

      it 'will not change the sell_in' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq(-20)
      end
    end

    context 'sulfuras, negative sell_in, minimum quality' do
      let(:inventory) { [Item.new('Sulfuras', -20, 0)] }
      let(:shop) { described_class.new(inventory) }
      it 'will not change the quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 0
      end

      it 'will not change the sell_in' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq(-20)
      end
    end

    context 'backstage pass, normal sell_in, normal quality' do
      let(:inventory) { [Item.new('Backstage passes', 20, 30)] }
      let(:shop) { described_class.new(inventory) }
      it 'increases in quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 31
      end

      it 'decreases in sell_in' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq 19
      end
    end

    context 'backstage pass, double sell_in, normal quality' do
      let(:inventory) { [Item.new('Backstage passes', 8, 30)] }
      let(:shop) { described_class.new(inventory) }
      it 'increases in quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 32
      end

      it 'decreases in sell_in' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq 7
      end
    end

    context 'backstage pass, triple sell_in, normal quality' do
      let(:inventory) { [Item.new('Backstage passes', 4, 30)] }
      let(:shop) { described_class.new(inventory) }
      it 'increases in quality' do
        shop.update_quality
        expect(shop.items[0].quality).to eq 33
      end

      it 'decreases in sell_in' do
        shop.update_quality
        expect(shop.items[0].sell_in).to eq 3
      end
    end
  end
end
