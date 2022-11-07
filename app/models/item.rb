# == Schema Information
#
# Table name: Item
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
#  index_selfs_on_organization_id  (organization_id)
#
class Item < ApplicationRecord
    def to_s
      "#{@name}, #{@sell_in}, #{@quality}"
    end
    
    def update #middle man -> feature envy
      QualityUpdater.new.update(self)
    end
end
