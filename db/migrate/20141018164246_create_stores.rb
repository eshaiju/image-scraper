class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :url
      t.integer :count ,:default =>1

      t.timestamps
    end
  end
end
