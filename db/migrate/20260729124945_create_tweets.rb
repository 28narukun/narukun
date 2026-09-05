class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.string :road
      t.date :day
      t.string :address
      t.text :about

      t.timestamps
    end
  end
end
