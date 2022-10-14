# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Organization, type: :model do
  describe '.update_quality' do
    subject { organization.update_quality }

    let(:organization) { create :organization }

    context 'when the sale by date has passed' do
      context 'when quality is already 0' do
        before do
          create :item, name: "+5 Dexterity Vest", sell_in: -1, quality: 0, organization_id: organization.id
        end
       
        it 'returns 0 for quality' do
          subject
          expect(organization.items.first.quality).to eq 0
        end
      end

      context 'when quality is > 0' do
        before do
          create :item, name: "+5 Dexterity Vest", sell_in: -1, quality: 2, organization_id: organization.id
          create :item, name: "Elixir of the Mongoose", sell_in: -1, quality: 4, organization_id: organization.id
        end
        
        it 'quality degrades twice as fast' do
          subject
          expect(organization.items.first.quality).to eq 0
          expect(organization.items.second.quality).to eq 2
        end
      end

      context 'when item is Sulfuras, Hand of Ragnaros' do        
        let!(:item) { create :item, name: "Sulfuras, Hand of Ragnaros", sell_in: 1, quality: 2, organization_id: organization.id } 
        
        it 'doess not change the item' do
          subject
          expect(organization.items.first).to eq item
        end
      end
    end
  end
end
