class AddOrganizationRefToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :organization, null: false, foreign_key: true
  end
end
