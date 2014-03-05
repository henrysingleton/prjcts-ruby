class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.references :user, index: true
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
