class ConjuredItemQualityUpdater < StandardQualityUpdater
    def update_quality(item)
        if item.sell_in <= 0
          bump(item, -4)
        else
          bump(item, -2)
        end
    end
end