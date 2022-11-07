# frozen_string_literal: true

class QualityUpdater
    UPDATERS = [
        [/^Sulfuras, Hand of Ragnaros$/, NoopQualityUpdater.new],
        [/^Aged Brie$/, BrieQualityUpdater.new],
        [/^Backstage passes to a TAFKAL80ETC concert$/, BackstagePassQualityUpdater.new],
        [/^Conjured /, ConjuredItemQualityUpdater.new],
    ]
    def update(item)
        update_one(item)
    end
    
    def update_one(item)
        updater_for(item).update(item)
    end

    def updater_for(item)
        pair = UPDATERS.detect { |re, handler| re =~ item.name }
        handler = pair ? pair[1] : standard_updater
    end

    def standard_updater
        @standard_handler ||= StandardQualityUpdater.new
    end
end