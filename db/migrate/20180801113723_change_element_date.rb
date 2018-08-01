class ChangeElementDate < ActiveRecord::Migration[5.2]
  def change
    change_column :elements, :date, :datetime
  end
end
