class CreateWebpages < ActiveRecord::Migration[5.1]
  def change
    create_table :webpages, id: false do |t|
      t.string :id, limit: 36, primary_key: true
      t.string :url
      t.string :protocol
      t.string :resource
      t.string :domain
      t.integer :checked_count
      t.timestamps
    end
  end
end
