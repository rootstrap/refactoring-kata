# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  quality    :integer
#  sell_in    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
end
