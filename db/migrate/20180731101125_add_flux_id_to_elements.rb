class AddFluxIdToElements < ActiveRecord::Migration[5.2]
  def change
    add_reference :elements, :flux, foreign_key: true
  end
end
