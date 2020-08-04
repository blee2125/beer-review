class AddColumnToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :rating, :integer
  end
end
