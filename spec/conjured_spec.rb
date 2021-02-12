# frozen_string_literal: true

require 'conjured'

# "#{@name}, #{@sell_in}, #{@quality}"

describe Conjured do
  describe '#update_item' do
    context 'normal sell_in, normal quality' do
      let(:conjured) { Item.new('Conjured', 20, 30) }
      it 'decreases quality by 2 and decreases sell_in by 1' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, 19, 28'
      end
    end

    context 'normal sell_in, minimum quality' do
      let(:conjured) { Item.new('Conjured', 20, 0) }
      it 'does not decrease quality past zero, sellin decrease by 1' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, 19, 0'
      end
    end

    context 'normal sell_in, 1 quality' do
      let(:conjured) { Item.new('Conjured', 20, 1) }
      it 'decreases in quality by 1' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, 19, 0'
      end
    end

    context 'negative sell_in, normal quality' do
      let(:conjured) { Item.new('Conjured', -20, 8) }
      it 'decreases in quality by 4' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, -21, 4'
      end
    end

    context 'negative sell_in, minimum quality' do
      let(:conjured) { Item.new('Conjured', -15, 0) }
      it 'doesnt decrease quality' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, -16, 0'
      end
    end

    context 'conjured, negative sell_in, 2 quality' do
      let(:conjured) { Item.new('Conjured', -15, 2) }
      it 'decreases to zero' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, -16, 0'
      end
    end

    context 'negative sell_in, 1 quality' do
      let(:conjured) { Item.new('Conjured', -15, 1) }
      it 'decreases in quality by 1' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, -16, 0'
      end
    end

    context 'negative sell_in, 2 quality' do
      let(:conjured) { Item.new('Conjured', -15, 2) }
      it 'decreases in quality by 2' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, -16, 0'
      end
    end

    context 'negative sell_in, 3 quality' do
      let(:conjured) { Item.new('Conjured', -15, 3) }
      it 'decreases in quality by 3' do
        conjured.extend(Conjured)
        conjured.update_item
        expect(conjured.to_s).to eq 'Conjured, -16, 0'
      end
    end
  end
end
