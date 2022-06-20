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
    string { "" }
    integer { "" }
    integer { "" }
  end
end
