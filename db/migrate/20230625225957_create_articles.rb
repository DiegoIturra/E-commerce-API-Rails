class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :image_url
      t.timestamps
    end
  end
end
