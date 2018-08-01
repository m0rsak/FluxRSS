class CreateFluxTable < ActiveRecord::Migration[5.2]
  def change
    create_table :fluxes do |t|
      t.string :title
      t.string :url
    end
  end
end
