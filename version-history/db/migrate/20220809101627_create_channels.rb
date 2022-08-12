class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :title

      t.timestamps
    end
    add_index :channels, :title, unique: true
  end
end
