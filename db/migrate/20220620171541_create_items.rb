class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quality
      t.integer :sell_in

      t.timestamps
    end
  end
end
