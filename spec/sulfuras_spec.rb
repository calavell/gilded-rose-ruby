# frozen_string_literal: true

require 'sulfuras'

# "#{@name}, #{@sell_in}, #{@quality}"

describe Sulfuras do
  describe '#update_item' do
    context 'sulfuras, normal sell_in, normal quality' do
      let(:sulfuras) { Item.new('Sulfuras', 20, 30) }
      it 'will not change the quality or sell_in' do
        sulfuras.extend(Sulfuras)
        sulfuras.update_item
        expect(sulfuras.to_s).to eq 'Sulfuras, 20, 30'
      end
    end

    context 'sulfuras, negative sell_in, normal quality' do
      let(:sulfuras) { Item.new('Sulfuras', -20, 30) }
      it 'will not change the quality or sell_in' do
        sulfuras.extend(Sulfuras)
        sulfuras.update_item
        expect(sulfuras.to_s).to eq 'Sulfuras, -20, 30'
      end
    end
  end
end
