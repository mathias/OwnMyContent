class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.integer :feed_id
      t.string :url
    end
  end
end
