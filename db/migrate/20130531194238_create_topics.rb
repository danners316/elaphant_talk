class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :body
      t.string :name

      t.timestamps
    end
  end
end
