class BackstagePassQualityUpdater < StandardQualityUpdater
    def update_quality(item)
        if item.sell_in > 10
          bump(item, 1)
        elsif item.sell_in > 5
          bump(item, 2)
        elsif item.sell_in > 0
          bump(item, 3)
        else
          item.quality = 0
        end
    end
end