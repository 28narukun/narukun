class AddCategoryDetailsToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :shop_detail, :text
    add_column :tweets, :speed_detail, :text
    add_column :tweets, :scenery_detail, :text
  end
end
