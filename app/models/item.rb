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
class Item < ApplicationRecord
    def to_s
        "#{@name}, #{@sell_in}, #{@quality}"
    end
end
