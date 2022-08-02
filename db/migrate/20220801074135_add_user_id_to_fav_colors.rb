class AddUserIdToFavColors < ActiveRecord::Migration[7.0]
  def change
    add_column :fav_colors, :user_id, :integer
    add_index :fav_colors, :user_id
  end
end
