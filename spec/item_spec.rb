# frozen_string_literal: true

require 'item'

# "#{@name}, #{@sell_in}, #{@quality}"

describe Item do
  describe '#update_item' do
    context 'normal sell_in, normal quality' do
      let(:toy) { Item.new('Toy', 20, 30) }
      it 'decreases in quality by 1 and decreases sell_in by 1' do
        toy.extend(StandardProcedures)
        toy.update_item
        expect(toy.to_s).to eq 'Toy, 19, 29'
      end
    end

    context 'normal sell_in, minimum quality' do
      let(:toy) { Item.new('Toy', 20, 0) }
      it 'will not decrease quality past 0' do
        toy.extend(StandardProcedures)
        toy.update_item
        expect(toy.to_s).to eq 'Toy, 19, 0'
      end
    end

    context 'negative sell_in, normal quality' do
      let(:toy) { Item.new('Toy', -20, 10) }
      it 'will decrease quality by 2' do
        toy.extend(StandardProcedures)
        toy.update_item
        expect(toy.to_s).to eq 'Toy, -21, 8'
      end
    end

    context 'negative sell_in, minimum quality' do
      let(:toy) { Item.new('Toy', -20, 0) }
      it 'will not decrease quality past 0' do
        toy.extend(StandardProcedures)
        toy.update_item
        expect(toy.to_s).to eq 'Toy, -21, 0'
      end
    end

    context 'negative sell_in, 1 quality' do
      let(:toy) { Item.new('Toy', -20, 1) }
      it 'will not decrease quality past 0' do
        toy.extend(StandardProcedures)
        toy.update_item
        expect(toy.to_s).to eq 'Toy, -21, 0'
      end
    end
  end
end
