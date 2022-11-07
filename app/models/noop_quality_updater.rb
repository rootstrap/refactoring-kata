# frozen_string_literal: true

class NoopQualityUpdater < StandardQualityUpdater
    def update_quality(item)
    end
    def update_sell_in(item)
    end
end