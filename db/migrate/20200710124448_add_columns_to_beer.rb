class AddColumnsToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :brewery, :string
    add_column :beers, :origin, :string
    add_column :beers, :style, :string
    add_column :beers, :abv, :integer
  end
end
