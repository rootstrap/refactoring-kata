AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
Setting.create_or_find_by!(key: 'min_version', value: '0.0')

organization = Organization.create(name: "Flea Market")
Item.create(name:"+5 Dexterity Vest", sell_in:10, quality:20, organization_id: organization.id)
Item.create(name:"Aged Brie", sell_in:2, quality:0, organization_id: organization.id)
Item.create(name:"Elixir of the Mongoose", sell_in:5, quality:7, organization_id: organization.id)
Item.create(name:"Sulfuras, Hand of Ragnaros", sell_in:0, quality:80, organization_id: organization.id)
Item.create(name:"Sulfuras, Hand of Ragnaros", sell_in:-1, quality:80, organization_id: organization.id)
Item.create(name:"Backstage passes to a TAFKAL80ETC concert", sell_in:15, quality:20, organization_id: organization.id)
Item.create(name:"Backstage passes to a TAFKAL80ETC concert", sell_in:10, quality:49, organization_id: organization.id)
Item.create(name:"Backstage passes to a TAFKAL80ETC concert", sell_in:5, quality:9, organization_id: organization.id)
# This Conjured item does not work properly yet
Item.create(name:"Conjured Mana Cake", sell_in:3, quality:6, organization_id: organization.id)