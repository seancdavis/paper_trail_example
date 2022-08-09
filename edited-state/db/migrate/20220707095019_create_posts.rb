class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :body, null: false, limit: 280
      t.belongs_to :user

      t.timestamps
    end
  end
end
