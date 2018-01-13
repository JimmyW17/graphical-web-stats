class CreatePageSources < ActiveRecord::Migration[5.1]
  def change
    create_table :page_sources do |t|
      t.references :page_history
      t.text :html
      t.timestamps
    end
  end
end
