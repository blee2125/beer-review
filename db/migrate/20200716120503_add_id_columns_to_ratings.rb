class AddIdColumnsToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :user_id, :integer
    add_column :ratings, :beer_id, :integer
  end
end
