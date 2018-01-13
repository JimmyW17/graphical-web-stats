class CreateWebpages < ActiveRecord::Migration[5.1]
  def change
    create_table :webpages do |t|
      t.string :uuid
      t.string :url
      t.string :protocol
      t.string :resource
      t.string :domain
      t.integer :checked_count
      t.timestamps
    end
    add_index :webpages, :uuid, unique: true
  end
end
