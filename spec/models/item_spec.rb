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
require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
