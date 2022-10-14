# == Schema Information
#
# Table name: items
#
#  id              :bigint           not null, primary key
#  name            :string
#  quality         :integer
#  sell_in         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_items_on_organization_id  (organization_id)
#
FactoryBot.define do
  factory :item do
    name { Faker::Track.name }
    sell_in { Faker::Number.between(from: 1, to: 50) }
    quality { Faker::Number.between(from: -1, to: 100) }
    organization
  end
end
