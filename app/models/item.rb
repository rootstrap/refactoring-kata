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
      if self.is_normal?
        self.normal_update
      elsif self.is_aged_brie?
        self.aged_brie_update
      elsif self.is_sulfuras?
        self.sulfuras_update
      elsif self.is_backstage_pass?
        self.backstage_update
      end
    end

    def normal_update
      self.sell_in -= 1
      return unless self.quality.positive?
      
      self.quality -= 1 if self.sell_in <= 0
      self.quality -= 1
    end

    def aged_brie_update
      self.sell_in -= 1
      return if self.quality >= 50

      self.quality += 1
      self.quality += 1 if self.sell_in <= 0 && self.quality < 50
    end

    def backstage_update
      self.sell_in -= 1
      return if self.quality >= 50
      return self.quality = 0 if self.sell_in < 0

      self.quality += 1
      self.quality += 1 if self.sell_in < 10
      self.quality += 1 if self.sell_in < 5
    end

    def sulfuras_update
      return
    end

    def is_normal?
      self.name == "Normal"
    end

    def is_sulfuras?
      self.name == "Sulfuras, Hand of Ragnaros"
    end

    def is_aged_brie?
      self.name == "Aged Brie"
    end

    def is_backstage_pass?
      self.name == "Backstage passes to a TAFKAL80ETC concert"
    end
end
