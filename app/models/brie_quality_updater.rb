class BrieQualityUpdater < StandardQualityUpdater
    def update_quality(item)
        if item.sell_in <= 0
          bump(item, 2)
        else
          bump(item, 1)
        end
    end
end