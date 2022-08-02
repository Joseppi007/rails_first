class CreateFavColors < ActiveRecord::Migration[7.0]
  def change
    create_table :fav_colors do |t|
      t.string :first_name
      t.string :last_name
      t.string :color

      t.timestamps
    end
  end
end
