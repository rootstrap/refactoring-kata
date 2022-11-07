class StandardQualityUpdater
    def update(item)
    update_quality(item)
    update_sell_in(item)
    end
  
    def update_quality(item)
        if item.sell_in <= 0
            bump(item, -2)
        else
            bump(item, -1)
        end
    end
  
    def update_sell_in(item)
        item.sell_in -= 1
    end
  
    def bump(item, amount)
        item.quality += amount
        item.quality = 50 if item.quality > 50
        item.quality = 0 if item.quality < 0
    end
end