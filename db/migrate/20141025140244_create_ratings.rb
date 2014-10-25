class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rater_id, null: false
      t.integer :ratee_id, null: false
      t.integer :beenz,    null: false

      t.timestamps
    end

    add_index :ratings, [:rater_id, :ratee_id], unique: true,
      name: 'udx_ratings_on_rid_and_rid'
  end
end
