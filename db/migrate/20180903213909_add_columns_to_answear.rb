class AddColumnsToAnswear < ActiveRecord::Migration[5.1]
  def change
    add_column :answears, :koukai, :string
  end
end
