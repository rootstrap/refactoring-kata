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

    context 'with a single item' do
      let(:sell_in) { 5 }
      let(:quality) { 10 }
      let(:name) { 'normal item' }
      
      before { create :item, name: name, sell_in: sell_in, quality: quality, organization_id: organization.id }

      context 'when item is normal' do
        it 'reduces the quality by 1' do
          subject
          expect(organization.items.first.quality).to eq 9
        end

        context 'when on sell_in date' do
          let(:sell_in) { 0 }

          it 'reduces the quality by 2' do
            subject
            expect(organization.items.first.quality).to eq 8
          end
        end

        context 'when after sell_in date' do
          let(:sell_in) { -10 }

          it 'reduces the quality by 2' do
            subject
            expect(organization.items.first.quality).to eq 8
          end
        end

        context 'when quality is 0' do
          let(:quality) { 0 }

          it 'returns 0 for quality' do
            subject
            expect(organization.items.first.quality).to eq 0
          end
        end
      end

      context 'when item is Aged Brie' do
        let(:name) { "Aged Brie" }
        
        it 'increases the quality by 1' do
          subject
          expect(organization.items.first.quality).to eq 11
        end

        context 'with max quality' do
          let(:quality) { 50 }

          it 'returns the same quality value' do
            subject
            expect(organization.items.first.quality).to eq 50
          end
        end

        context 'when on sell_in date' do
          let(:sell_in) { 0 }

          it 'increases the quality by 2' do
            subject
            expect(organization.items.first.quality).to eq 12
          end

          context 'when near max quality' do
            let(:quality) { 49 }

            it 'does not go over the max' do
              subject
              expect(organization.items.first.quality).to eq 50
            end
          end
        end

        context 'when after sell_in date' do
          let(:sell_in) { -10 }

          it 'increases the quality by 2' do
            subject
            expect(organization.items.first.quality).to eq 12
          end

          context 'when near max quality' do
            let(:quality) { 49 }

            it 'does not go over the max' do
              subject
              expect(organization.items.first.quality).to eq 50
            end
          end
        end
      end

      context 'when item is Sulfuras' do
        let(:name) { "Sulfuras, Hand of Ragnaros" }
        let(:quality) { 80 }

        it 'does not change the item' do
          subject
          expect(organization.items.first.quality).to eq 80
          expect(organization.items.first.sell_in).to eq 5
        end
        
        context 'when on sell_in date' do
          let(:sell_in) { 0 }

          it 'does not change the quality' do
            subject
            expect(organization.items.first.quality).to eq 80
          end
        end

        context 'when after sell_in date' do
          let(:sell_in) { -10 }

          it 'does not change the quality' do
            subject
            expect(organization.items.first.quality).to eq 80
          end
        end
      end

      context 'when item is Backstage pass' do
        let(:name) { "Backstage passes to a TAFKAL80ETC concert" }

        it 'increases the quality by 3' do
          subject
          expect(organization.items.first.quality).to eq 13
        end

        context "long before sell_in date" do
          let(:sell_in) { 11 }

          it 'increases the quality by 1' do
            subject
            expect(organization.items.first.quality).to eq 11
          end
        end

        context "when medium close to sell_in date (upper bound)" do
          let(:sell_in) { 10 }

          it 'increases the quality by 2' do
            subject
            expect(organization.items.first.quality).to eq 12
          end
        end

        context "when medium close to sell_in date (lower bound)" do
          let(:sell_in) { 6 }

          it 'increases the quality by 2' do
            subject
            expect(organization.items.first.quality).to eq 12
          end
        end

        context "very close to sell date (upper bound)" do
          let(:sell_in) { 5 }

          it 'increases the quality by 3' do
            subject
            expect(organization.items.first.quality).to eq 13
          end
        end

        context "very close to sell date (upper bound)" do
          let(:sell_in) { 1 }

          it 'increases the quality by 3' do
            subject
            expect(organization.items.first.quality).to eq 13
          end
        end

        context "when on sell_in date" do
          let(:sell_in) { 0 }

          it 'reduces the quality to 0' do
            subject
            expect(organization.items.first.quality).to eq 0
          end
        end

        context "when after sell_in date" do
          let(:sell_in) { -10 }

          it 'reduces the quality to 0' do
            subject
            expect(organization.items.first.quality).to eq 0
          end
        end
      end
    end
  end
end
