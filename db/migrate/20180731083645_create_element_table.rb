class CreateElementTable < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.string :title
      t.text :resum
      t.string :date
      t.boolean :status
      t.string :url
    end
  end
end
