# frozen_string_literal: true

require 'backstage_pass'

# "#{@name}, #{@sell_in}, #{@quality}"

describe BackstagePass do
  describe '#update_item' do
    context 'backstage pass, normal sell_in, normal quality' do
      let(:backstage_pass) { Item.new('Backstage pass', 20, 30) }
      it 'increases in quality by 1 and decreses sell_in by 1' do
        backstage_pass.extend(BackstagePass)
        backstage_pass.update_item
        expect(backstage_pass.to_s).to eq 'Backstage pass, 19, 31'
      end
    end

    context 'backstage pass, double sell_in, normal quality' do
      let(:backstage_pass) { Item.new('Backstage pass', 8, 30) }
      it 'increases in quality by 2, decreases sell_in by 1' do
        backstage_pass.extend(BackstagePass)
        backstage_pass.update_item
        expect(backstage_pass.to_s).to eq 'Backstage pass, 7, 32'
      end
    end

    context 'backstage pass, triple sell_in, normal quality' do
      let(:backstage_pass) { Item.new('Backstage pass', 3, 30) }
      it 'increases in quality' do
        backstage_pass.extend(BackstagePass)
        backstage_pass.update_item
        expect(backstage_pass.to_s).to eq 'Backstage pass, 2, 33'
      end
    end

    context 'backstage pass, minimum sell_in, normal quality' do
      let(:backstage_pass) { Item.new('Backstage pass', 0, 30) }
      it 'increases in quality' do
        backstage_pass.extend(BackstagePass)
        backstage_pass.update_item
        expect(backstage_pass.to_s).to eq 'Backstage pass, -1, 0'
      end
    end

    context 'backstage pass, negative sell_in, minimum quality' do
      let(:backstage_pass) { Item.new('Backstage pass', -6, 30) }
      it 'increases in quality' do
        backstage_pass.extend(BackstagePass)
        backstage_pass.update_item
        expect(backstage_pass.to_s).to eq 'Backstage pass, -7, 0'
      end
    end
  end
end
