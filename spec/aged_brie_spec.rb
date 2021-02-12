# frozen_string_literal: true

require 'aged_brie'

# "#{@name}, #{@sell_in}, #{@quality}"

describe AgedBrie do
  describe '#update_item' do
    context 'normal sell_in, normal quality' do
      let(:brie) { Item.new('Aged Brie', 20, 30) }
      it 'increases in quality by 1 and decreases sell_in by 1' do
        brie.extend(AgedBrie)
        brie.update_item
        expect(brie.to_s).to eq 'Aged Brie, 19, 31'
      end
    end

    context 'normal sell_in, max quality' do
      let(:brie) { Item.new('Aged Brie', 20, 50) }
      it 'will not increase quality past 50' do
        brie.extend(AgedBrie)
        brie.update_item
        expect(brie.to_s).to eq 'Aged Brie, 19, 50'
      end
    end
  end
end
