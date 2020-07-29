class ChangeAbvFromIntegerToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :beers, :abv, :float
  end
end
