class CreatePageHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :page_histories do |t|
      t.references :webpage
      t.timestamps
    end
  end
end
